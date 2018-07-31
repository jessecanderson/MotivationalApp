//
//  ViewController.swift
//  MotivationalQuotes
//
//  Created by Jesse Anderson on 7/30/18.
//  Copyright © 2018 Jesse Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteBackgroundImage: UIImageView!
    
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var authorText: UILabel!
    
    let networkHandler = NetworkHandler()
    var quoteResponse: QuoteResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayRandomQuoteInformation()
    }
    
    func displayRandomQuoteInformation() {
        
        // quoteResponse = networkHandler.makeNetworkCall()
        networkHandler.makeNetworkCall { (result: QuoteResponse?) in
            
            guard let quoteResponse = result else {
                return
            }
            
            DispatchQueue.main.async {
                self.quoteText.text = quoteResponse.contents?.quotes![0].quote
                self.authorText.text = quoteResponse.contents?.quotes![0].author
            }
            
            
            
            let backgroundURL = URL.init(string: (quoteResponse.contents?.quotes![0].background)!)
            
            do {
                let imageData = try Data.init(contentsOf: backgroundURL!)
                DispatchQueue.main.async {
                    self.quoteBackgroundImage.image = UIImage(data: imageData)
                }
                
            } catch let error as Error {
                print(error)
            }
           
            
            
            
        }
        
    }


}

