//
//  ScoreKeeperTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Austin Dobberfuhl on 11/7/23.
//

import UIKit

//knows about scores and passing the information back from the tableview controllers , what do i do with that information 

class ScoreKeeperTableViewController: UITableViewController {
    
    var players: [Player] = [Player(name: "kdsfbewdsfbefhm", score: 100), Player(name: "?jim", score: 10), Player(name: "tryingtotaptomuch", score: 329), Player(name: "john", score: 11)]
    
    
    var sortedPlayers: [Player] {
        players.sorted(by: >)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerData", for: indexPath) as! PlayerTableViewCell
        
        cell.delegate = self
        
        let playersPlaying = sortedPlayers[indexPath.row]
        
        cell.showsReorderControl = true
        cell.updatePlayerCell(with: playersPlaying)
        
        return cell
    }
    

    @IBAction func unwindToScoreBoard(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as? NewPlayerTableViewController
        
        if let player = sourceViewController?.players {
            if let indexOfExisitingPlayer = players.firstIndex(of: player) {
                players[indexOfExisitingPlayer] = player
                tableView.reloadRows(at: [IndexPath(row: indexOfExisitingPlayer, section: 0)], with: .automatic)
            } else {
                let newIndexPath = IndexPath(row: players.count, section: 0)
                players.append(player)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                tableView.reloadData()
            }
        }
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ScoreKeeperTableViewController: addedPlayer {
    func needsAPlayer(player: Player?) {
        guard let player else { return }
        if let row = players.firstIndex(of: player) {
            players[row] = player
        }
        tableView.reloadData()
    }
}
