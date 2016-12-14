import MotionKit

//
// This code was adapted from
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Ring%20Buffer
// Thank you Matthijs Hollemans, whoever you are
//

public struct RingBuffer<T> {
    public var array: [T?]
    public var readIndex = 0
    fileprivate var writeIndex = 0

    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }

    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }

    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }

    fileprivate var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }

    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }

    fileprivate var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }

    public var isFull: Bool {
        return availableSpaceForWriting == 0
    }
}

public class MotionHandler {
    private let interval : Double;
    private let motionKit = MotionKit()
    public var accelBuffer = RingBuffer<(Double, Double, Double)>(count: 50)
    public var gyroBuffer = RingBuffer<(Double, Double, Double)>(count: 50)

    init(i: Double) {
        self.interval = i
    }

    public func start() {
        self.motionKit.getAccelerometerValues(self.interval) {
            (x, y, z) in
            _ = self.accelBuffer.write((x, y, z))
        }
        self.motionKit.getGyroValues(self.interval) {
            (x, y, z) in
            _ = self.gyroBuffer.write((x, y, z))
        }
    }
    
    public func stop() {
        motionKit.stopAccelerometerUpdates()
        motionKit.stopGyroUpdates()
    }
    
    public func getData() -> [[Double]] {
        var data = [[Double]](repeating:[Double](repeating:Double(), count:50), count:6)
        // populate data from ring buffers
        for i in 0...50 {
            let accelIndex = (self.accelBuffer.readIndex - i) % 50
            data[i][0] = (self.accelBuffer.array[accelIndex]?.0)!
            data[i][1] = (self.accelBuffer.array[accelIndex]?.1)!
            data[i][2] = (self.accelBuffer.array[accelIndex]?.2)!
            let gyroIndex = (self.gyroBuffer.readIndex - i) % 50
            data[i][3] = (self.gyroBuffer.array[gyroIndex]?.0)!
            data[i][4] = (self.gyroBuffer.array[gyroIndex]?.1)!
            data[i][5] = (self.gyroBuffer.array[gyroIndex]?.2)!
        }
        // process data by averaging with a sliding window
        for i in 1...49 {
            for j in 0...5 {
                data[i][j] = (data[i][j-1] + data[i][j] + data[i][j+1]) / 3.0
            }
        }
        return data
    }
}

