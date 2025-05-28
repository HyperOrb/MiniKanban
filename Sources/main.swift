import Foundation

@main
@MainActor
struct App {
    static var tasks: [String] = []

    static func showHeader(_ title: String) {
        print("\n-------------------------------")
        print("  \(title)")
        print("-------------------------------\n")
    }

    static func showMenu() {
        showHeader("📝 Mini Kanban Dashboard")
        print("1️⃣  Add Task")
        print("2️⃣  View Tasks")
        print("3️⃣  Remove Task")
        print("4️⃣  Exit")
        print("\nPick an option (1-4): ", terminator: "")
    }

    static func addTask() {
        showHeader("➕ Add a New Task")
        print("Enter a task description:")
        print("> ", terminator: "")

        if let input = readLine(), !input.trimmingCharacters(in: .whitespaces).isEmpty {
            tasks.append(input.trimmingCharacters(in: .whitespaces))
            print("✅ Added!")
        } else {
            print("⚠️  Please type something, can’t be empty.")
        }
    }

    static func viewTasks() {
        showHeader("📋 Your Tasks")
        if tasks.count == 0 {
            print("✨ Nothing here yet. Try adding something.")
        } else {
            for (i, t) in tasks.enumerated() {
                print("• \(i + 1). \(t)")
            }
        }
    }

    static func removeTask() {
        showHeader("🗑 Remove a Task")

        if tasks.isEmpty {
            print("✨ No tasks to remove.")
            return
        }

        viewTasks()
        print("\nWhich task number do you want to remove?")
        print("> ", terminator: "")
        
        if let input = readLine(),
           let num = Int(input),
           num > 0 && num <= tasks.count {
            let removed = tasks.remove(at: num - 1)
            print("🗑 Removed: '\(removed)'")
        } else {
            print("❌ Hmm, that’s not a valid number.")
        }
    }

    static func main() {
        print("🎉 Welcome to your Mini Kanban Dashboard!")

        while true {
            showMenu()
            guard let choice = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                continue
            }

            switch choice {
            case "1": addTask()
            case "2": viewTasks()
            case "3": removeTask()
            case "4":
                print("\n👋 Thanks for using the dashboard. Catch you later!")
                return
            default:
                print("❗ That’s not a valid option. Try 1 to 4.")
            }
        }
    }
}
