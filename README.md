
# Initial setup

Run: `pod install`

# Usage

Create your custom `UITableViewCell`, that conforms to `ConfigurableCell`. Example:
```swift
class UserCell: ConfigurableCell {
    
    func configure(with user: User) {
        textLabel?.text = user.name
    }
}
```
On your `UIViewController`:
```swift
class ViewController: UIViewController {
    
    let users = [User(name: "John Doe"), User(name: "Jane Roe")]
    
    lazy var userSection = SectionBuilder<User, UserCell>(items: users)
    
    lazy var adapter = TableAdapter(list: [userSection)

    ...

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.setAdapter(adapter)

        /// For get select action on Section
        userSection.didSelected = { (model) in
            print(model)
        }
    }

    ...
}

```
Or you can cast builders like:
```swift
class ViewController: UIViewController {
    ...
    lazy var adapter = TableAdapter()
    ...
    override func viewDidLoad() {
        super.viewDidLoad()
        ...
        adapter += userSection
        ...
    }
}
```
![Screenshot](demo.png =370x800)
