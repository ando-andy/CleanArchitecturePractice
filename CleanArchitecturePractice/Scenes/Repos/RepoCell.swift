import UIKit

final class RepoCell: UITableViewCell, NibReusable {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarURLStringImageView: UIImageView!
    
    func bindViewModel(_ viewModel: RepoViewModel?) {
        if let viewModel = viewModel {
            nameLabel.text = viewModel.name
            avatarURLStringImageView.sd_setImage(with: viewModel.url, completed: nil)
        } else {
            nameLabel.text = ""
            avatarURLStringImageView.image = nil
        }
    }
}

