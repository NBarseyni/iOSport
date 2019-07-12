//
//  ProgramViewController.swift
//  iOSport
//
//  Created by etudiant on 14/05/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class ProgramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let programs: NSMutableArray = Programme.loadPrograms()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programmeCell", for: indexPath)
        
        let p = programs.object(at: indexPath.row) as! Programme
        cell.textLabel?.text = p.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let p = programs.object(at: indexPath.row) as! Programme
        
        let spvc = self.storyboard?.instantiateViewController(withIdentifier: "singleProgramVC") as! SingleProgramViewController
        spvc.program = p
        
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Programme.saveToPlist(programs: programs)
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        let addProgramVC = segue.source as! AddProgramViewController
        
        let newProgram = addProgramVC.program
        
        programs.add(newProgram)
        tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
