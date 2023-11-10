//
//  PlayerTableViewCell.swift
//  ScoreKeeperApp
//
//  Created by Austin Dobberfuhl on 11/8/23.
//

import UIKit

protocol addedPlayer {
    func needsAPlayer(player: Player?)
}

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreStepper: UIStepper!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    var delegate: addedPlayer?
    
    var players: Player?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        scoreStepper.maximumValue = .infinity
        scoreStepper.minimumValue = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func scoreStepperChanger(_ sender: UIStepper) {
        scoreLabel.text = String(Int(sender.value))
        let newScoreInt = Int(sender.value)
        scoreLabel.text = String(newScoreInt)
        players?.score = newScoreInt
        delegate?.needsAPlayer(player: players)
    }
    
    func updatePlayerCell(with player: Player) {
        self.players = player
        scoreLabel.text = String(player.score)
        playerNameLabel.text = player.name
        scoreStepper.value = Double(player.score)
    }
    
}
