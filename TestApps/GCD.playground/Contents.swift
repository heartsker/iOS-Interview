import Foundation

// MARK: - OK
// 1 7 2 3 4 5 6

//print(1)
//DispatchQueue.global().async {
//    print(2)
//    DispatchQueue.global().sync {
//        print(3)
//        DispatchQueue.global().sync {
//            print(4)
//        }
//        print(5)
//    }
//    print(6)
//}
//print(7)

// MARK: - Deadlock - main.sync from sync context
// 1 2

//print(1)
//DispatchQueue.global().sync {
//    print(2)
//    DispatchQueue.main.sync { // Deadlock - calling main.sync from sync context
//        print(3)
//    }
//    print(4)
//}
//print(5)


// MARK: - Deadlock - calling main.sync from main.async context
// 1 5 2

//print(1)
//DispatchQueue.main.async {
//    print(2)
//    DispatchQueue.main.sync { // Deadlock - calling main.sync from main.async context
//        print(3)
//    }
//    print(4)
//}
//print(5)

// MARK: -
//

var threadInfo: String {
    Thread.current.isMainThread ? "main" : "background"
}

print(1, threadInfo)
DispatchQueue.global().async {
    print(2, threadInfo)
    DispatchQueue.global().sync {
        print(3, threadInfo)
        DispatchQueue.main.sync {
            print(4, threadInfo)
        }
        print(5, threadInfo)
    }
    print(6, threadInfo)
}
print(7, threadInfo)
