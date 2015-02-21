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
    
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var topMessage: UIView!
    var messageOriginalPosition: CGPoint!

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
            println(messageOriginalPosition )
            println(sender.translationInView(view))
            
            sender.view!.center = CGPoint(x: messageOriginalPosition.x + sender.translationInView(view).x, y: messageOriginalPosition.y)
        } else if (sender.state == UIGestureRecognizerState.Ended) {
            
        }
    }
}