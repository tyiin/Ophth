//
//  ViewController.swift
//  Opth
//
//  Created by Angie Ta on 2/14/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import UIKit

// view controller of card front
class ViewController: UIViewController{

    static let cardCornerRadius: CGFloat = 25
    
    @IBOutlet weak var cardFront: UILabel!
    @IBOutlet weak var card: UIView!
    
   // var subtopic: Subtopic!
    var topic: Topic!
    var curIndex = 0 //Int?
    var curTopicIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
        parse.csv(data: "/Users/nomunabatmandakh/Desktop/Opth/Opth/Information/biggerdata.txt")
        //parse.csv(data:"/Users/cathyhsieh/Documents/GitHub/Opth/Opth/Information/biggerdata.txt")
=======

        parse.csv(data:"/Users/cathyhsieh/Desktop/temp.txt")
>>>>>>> 457fd9a1f567ef481f5a20df72a7259180edce90
        //status.printContents()


        status.calculateReviewList();
        self.loadData()
    }
    
    func loadData(){
        cardFront.text = topic.subtopics[curIndex].subtopicName
        //subtopic?.subtopicName//status.ReviewList[status.curReviewIndex].subtopicName
        
        card.layer.cornerRadius = 4.0
        card.layer.borderWidth = 1.0
        card.layer.borderColor = UIColor.clear.cgColor
        card.layer.masksToBounds = false
        card.layer.shadowColor = UIColor.gray.cgColor
        card.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        card.layer.shadowRadius = 4.0
        card.layer.shadowOpacity = 1.0
        card.layer.masksToBounds = false
        card.layer.shadowPath = UIBezierPath(roundedRect: card.bounds, cornerRadius: card.layer.cornerRadius).cgPath
        
    }
    
    @IBAction func handleTap(_ sender: Any) {
        if (topic.subtopics[curIndex].img_list[0] == "noimage") {
            performSegue(withIdentifier: "reveal", sender: nil)
        }
        else {
            performSegue(withIdentifier: "revealImage", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reveal",
            let destinationViewController = segue.destination as? CardRevealViewController {
                destinationViewController.cards = topic.subtopics[curIndex].cards
<<<<<<< HEAD
                destinationViewController.subtopic = topic.subtopics[curIndex].subtopicName
=======
>>>>>>> 457fd9a1f567ef481f5a20df72a7259180edce90
                destinationViewController.transitioningDelegate = self
            // delay changes to current VC until after  flip animation
        }
        else if segue.identifier == "revealImage",
            let destinationViewController = segue.destination as? ImageCardRevealViewController {
            destinationViewController.cards = topic.subtopics[curIndex].cards
<<<<<<< HEAD
            destinationViewController.subtopic = topic.subtopics[curIndex].subtopicName
=======
>>>>>>> 457fd9a1f567ef481f5a20df72a7259180edce90
            destinationViewController.transitioningDelegate = self
            destinationViewController.currentSubIndex = curIndex
            destinationViewController.currentTopIndex = curTopicIndex
            // delay changes to current VC until after  flip animation
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if(self.curIndex < self.topic.subtopics.count - 1) {
                self.curIndex = self.curIndex + 1
                self.loadData()
            }
        }
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            return FlipPresentAnimationController(originFrame: card.frame)
    }
}
