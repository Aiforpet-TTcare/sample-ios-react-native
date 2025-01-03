//
//  ViewController.swift
//  Example
//
//  Created by Jay Lee on 7/19/24.
//

import UIKit
import TTSDK

enum EampleType: CaseIterable {
    case eyeDog
    case toothDog
    case skinDog
    case jointDog
    case eyeCat
    case toothCat
    case clearUserDefaults
    
    static var cases: [[EampleType]] {
        return [
            // "Camera - Dog"
            [.eyeDog, .toothDog, .skinDog, .jointDog],
            // "Camera - Cat"
            [.eyeCat, .toothCat],
            // "Other"
            [.clearUserDefaults]
        ]
    }
    
    static var sectionTitle: [String] {
        return ["Camera - Dog", "Camera - Cat", "Other"]
    }
    
    var title: String {
        switch self {
        case .eyeDog:
            "Eye"
        case .toothDog:
            "Tooth"
        case .skinDog:
            "Skin"
        case .jointDog:
            "Joint"
        case .eyeCat:
            "Eye"
        case .toothCat:
            "Tooth"
        case .clearUserDefaults:
            "Clear User Data"
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        EampleType.cases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        EampleType.cases[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CameraTypeCell", for: indexPath) as? CameraTypeCell else {
            fatalError("CameraTypeCell not found!")
        }
        cell.icon.image = UIImage(named: "AppIcon")
        cell.titleLabel.text = EampleType.cases[safe: indexPath.section]?[safe: indexPath.row]?.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let type = EampleType.cases[safe: indexPath.section]?[safe: indexPath.row] else {
            return
        }
        switch type {
        case .eyeDog:
            TTManager.eye(petType: .dog, petId: "PetID", userId: "UserID", guideUrl: "https://naver.com") { [weak self] result, _ in
                let alert = UIAlertController(title: "Result", message: String(describing: result), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        case .toothDog:
            TTManager.tooth(petType: .dog) { [weak self] result, _ in
                let alert = UIAlertController(title: "Result", message: String(describing: result), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        case .skinDog:
            TTManager.skin(petType: .dog) { [weak self] result, _ in
                let alert = UIAlertController(title: "Result", message: String(describing: result), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        case .jointDog:
            TTManager.joint(petType: .dog) { [weak self] result, _ in
                let alert = UIAlertController(title: "Result", message: String(describing: result), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        case .eyeCat:
            TTManager.eye(petType: .cat) { [weak self] result, _ in
                let alert = UIAlertController(title: "Result", message: String(describing: result), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        case .toothCat:
            TTManager.tooth(petType: .cat) { [weak self] result, _ in
                let alert = UIAlertController(title: "Result", message: String(describing: result), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        case .clearUserDefaults:
            TTManager.clearUserDefaults()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        EampleType.sectionTitle[safe: section]
    }
}



extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
