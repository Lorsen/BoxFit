import MotionKit

//
// This code was adapted from
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Ring%20Buffer
// Thank you Matthijs Hollemans, whoever you are
//

public struct RingBuffer<T> {
    public var array: [T?]
    fileprivate var readIndex = 0
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
    public var accelBuffer = RingBuffer<(Double, Double, Double)>(count: 100)
    public var gyroBuffer = RingBuffer<(Double, Double, Double)>(count: 100)

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
}

