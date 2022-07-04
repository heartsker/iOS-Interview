import Foundation

let longTask = {
    print("Starting long task")
    sleep(2)
    print("Finished long task")
}

let longRandom: () -> Int = {
    sleep(1)

    return Int.random(in: 0 ... 10)
}


let queue = DispatchQueue(label: "Serial queue")
let group = DispatchGroup()

queue.async(group: group) {
    sleep(1)
    print("Task 1 done")
}

queue.async(group: group) {
    sleep(2)
    print("Task 2 done")
}

group.wait()

print("All tasks done")

// MARK: - Sync vs. Async

//print("Starting async")
//DispatchQueue.global().sync {
//    longTask()
//    print("Hello, I am on async")
//}
//
//print("Code after async")
//
//print("Starting sync")
//DispatchQueue.global().sync {
//    longTask()
//    print("Hello, I am on sync")
//}
//
//print("Code after sync")

// MARK: - Dispatch groups

let group = DispatchGroup()

//DispatchQueue.global().async(group: group) {
//    longTask()
//}
//
//group.notify(queue: .global()) {
//    print("Finished group")
//}

//for _ in 0 ..< 5 {
//    group.enter()
//
//    DispatchQueue.global().async {
//        longTask()
//        group.leave()
//    }
//}
//
//group.notify(queue: .global()) {
//    print("Finished 5 tasks")
//}
//
//print("The code after the loop")

// MARK: - Serial vs. Concurrent queues

//let serialQueue = DispatchQueue(label: "com.heartsker.serial-queue")
//let concurrentQueue = DispatchQueue(label: "com.heartsker.concurrent-queue", attributes: .concurrent)
//
//let serialGroup = DispatchGroup()
//let concurrentGroup = DispatchGroup()
//
//let start1 = Double(DispatchTime.now().uptimeNanoseconds)
//
//serialGroup.enter()
//
//serialQueue.sync {
//    longTask()
//    longTask()
//    longTask()
//    serialGroup.leave()
//}
//
//serialGroup.notify(queue: serialQueue) {
//    print("Done serial")
//}
//
//let end1 = Double(DispatchTime.now().uptimeNanoseconds)
//
//let start2 = Double(DispatchTime.now().uptimeNanoseconds)
//
//concurrentGroup.enter()
//
//concurrentQueue.sync {
//    longTask()
//    longTask()
//    longTask()
//    concurrentGroup.leave()
//}
//
//concurrentGroup.notify(queue: concurrentQueue) {
//    print("Done concurrent")
//}
//
//let end2 = Double(DispatchTime.now().uptimeNanoseconds)
//
//print("Serial time: \((end1 - start1) / 1_000_000) ms")
//print("Concurrent time: \((end2 - start2) / 1_000_000) ms")


//DispatchQueue.global().sync {
//    print("Hello")
//}
//
//DispatchQueue.global().async {
//    print("Bye")
//}
//
//print("All")

