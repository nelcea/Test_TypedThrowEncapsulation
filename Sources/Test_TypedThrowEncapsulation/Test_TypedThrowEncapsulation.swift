import Foundation

@main
struct Test_TypedThrowEncapsulation {
    static func main() {
        do {
            try Level1.encapsulateLevel2()
        } catch {
            print(error.localizedDescription)
        }
    }
}

enum Level1 {
    // This crashes the compiler
    static func encapsulateLevel2() throws(Level1Error) {
        do throws(Level2Error) {
            try Level2.throwLevel2Error()
        } catch let error as Level2Error {
            throw Level1Error.level2(error)
        }
    }

    /*
    // Removing "let error as Level2Error" makes it compile and run fine
    static func encapsulateLevel2() throws (Level1Error) {
        do throws(Level2Error) {
            try Level2.throwLevel2Error()
        } catch {
            throw Level1Error.level2(error)
        }
    }
    */

    /*
    // Additionally removing the typed from the do/catch also works
    static func encapsulateLevel2() throws (Level1Error) {
        do {
            try Level2.throwLevel2Error()
        } catch {
            throw Level1Error.level2(error)
        }
    }
    */

    /*
    // Removing the type from throws makes it work, with a warning as the "as Level2Error" is redundant
    static func encapsulateLevel2() throws {
        do throws(Level2Error) {
            try Level2.throwLevel2Error()
        } catch let error as Level2Error {
            throw Level1Error.level2(error)
        }
    }
    */

    /*
    // Additionally removing the typed from the do/catch also works, with the same warning
    static func encapsulateLevel2() throws {
        do {
            try Level2.throwLevel2Error()
        } catch let error as Level2Error {
            throw Level1Error.level2(error)
        }
    }
    */

}

enum Level2 {
    static func throwLevel2Error() throws(Level2Error) {
        throw Level2Error.two_one
    }
}


enum Level1Error: Error {
    case level1
    case level2(Level2Error)
}

enum Level2Error: Error {
    case two_one
    case two_two
}