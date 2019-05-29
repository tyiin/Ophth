//
//  TabBarController.swift
//  Opth
//
//  Created by Angie Ta on 5/13/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // indexes mess up the topic SR need to double check this
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        if viewController is ContentsOfTableViewController{
            if(spacedRep.all_active == true){// switch from mass SR store mass SR curReview
                if(spacedRep.all_subtopics.count != 0){
                    spacedRep.all_curReviewIndex = spacedRep.curReviewIndex
                    spacedRep.all_active = false
                }
                spacedRep.clear()
            }
        }
        else if viewController is ViewControllerReview{
            spacedRep.all_active = true
            spacedRep.curReviewIndex = spacedRep.all_curReviewIndex
            spacedRep.reviewList = spacedRep.all_subtopics
        }
        else if viewController is scrollProgressViewController{
            status.progressVC?.accumulatesProgress()
            status.progressVC?.animatePulsatingLayer()
        }
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
