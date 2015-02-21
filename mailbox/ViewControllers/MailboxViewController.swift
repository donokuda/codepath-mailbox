//
//  MailboxViewController.swift
//  mailbox
//
//  Created by Don Okuda on 2/20/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var helpImageView: UIImageView!
    @IBOutlet weak var mailScrollView: UIScrollView!
    @IBOutlet weak var leftActionIcon: UIImageView!
    @IBOutlet weak var rightActionIcon: UIImageView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var topMessage: UIView!
    
    var messageOriginalPosition: CGPoint!
    var archiveIcon: UIImage! = UIImage(named: "archive_icon")
    var deleteIcon: UIImage! = UIImage(named: "delete_icon")
    var listIcon: UIImage! = UIImage(named: "list_icon")
    var laterIcon: UIImage! = UIImage(named: "later_icon")
    
    var actionBounds = [-50.0, 20, 270, 410]
    var archiveColor = UIColor(red: 0.384, green: 0.835, blue: 0.314, alpha: 1)
    var deleteColor = UIColor(red: 0.894, green: 0.239, blue: 0.153, alpha: 1)
    var listColor = UIColor(red: 0.808, green: 0.588, blue: 0.384, alpha: 1)
    var laterColor = UIColor(red: 0.973, green: 0.796, blue: 0.153, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        var totalWidth = searchImageView.frame.width
        var totalHeight = feedImage.frame.height + searchImageView.frame.height + helpImageView.frame.height + topMessage.frame.height
        

        mailScrollView.contentSize = CGSizeMake(totalWidth, totalHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        if (sender.state == UIGestureRecognizerState.Began) {
           messageOriginalPosition = sender.view!.center
        } else if (sender.state == UIGestureRecognizerState.Changed) {
            var newPosition = messageOriginalPosition.x + sender.translationInView(view).x
            sender.view!.center = CGPoint(x: newPosition, y: messageOriginalPosition.y)
            println(newPosition)
            
            if (Int(newPosition) < Int(actionBounds[0])) {
               println("List")
            } else if (Int(actionBounds[0]) < Int(newPosition) &&
                Int(newPosition) < Int(actionBounds[1])) {
                println("later")
            } else if (Int(actionBounds[1]) < Int(newPosition) &&
                Int(newPosition) < Int(actionBounds[2])) {
                println("idle")
            } else if (Int(actionBounds[2]) < Int(newPosition) &&
                Int(newPosition) < Int(actionBounds[3])) {
                println("archive")
            } else {
                println("delete")
            }
            
            
        } else if (sender.state == UIGestureRecognizerState.Ended) {
           sender.view!.center = messageOriginalPosition
            
        }
    }
}