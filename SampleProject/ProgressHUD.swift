//
//  ProgressHUD.swift
//  eBluCarePatient
//
//  Created by BMS0015 on 10/08/15.
//  Copyright (c) 2015 BMS0015. All rights reserved.
//

import UIKit

class ProgressHUD: UIView {

    private var backGroundView : UIView?
    private var progressIndicator : UIActivityIndicatorView?
    private var titleLabel : UILabel?
    private var footerLabel : UILabel?

    var headerColor : UIColor
    var footerColor : UIColor
    var backGroundColor : UIColor
    var loaderColor : UIColor
    var timer = NSTimer()
    
    class var sharedHUD : ProgressHUD {
        struct Static {
            static var instance : ProgressHUD?
            static var token : dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = ProgressHUD()
        }
        return Static.instance!
    }
    
    init()
    {
        //Initialising Code
        headerColor = UIColor.whiteColor()
        footerColor = UIColor.whiteColor()
        backGroundColor = UIColor.blackColor()
        loaderColor = UIColor.whiteColor()
        super.init(frame: CGRectZero)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        headerColor = UIColor.whiteColor()
        footerColor = UIColor.whiteColor()
        backGroundColor = UIColor.blackColor()
        loaderColor = UIColor.whiteColor()
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect)
    {
        headerColor = UIColor.whiteColor()
        footerColor = UIColor.whiteColor()
        backGroundColor = UIColor.blackColor()
        loaderColor = UIColor.whiteColor()
        super.init(frame: frame)
    }
    
    // Show the loader added to the mentioned view with the provided title and footer texts
    func showInView(view : UIView, withHeader title : String?, andFooter footer : String?, progressBar: Bool?)
    {
        self.hide()
        self.frame = view.frame
        setIndicator()
        
        if title != nil && !isCleanedStringEmpty(title!)
        {
            setTitleLabel(title!)
            titleLabel!.frame = CGRectMake(0, 0, getLabelSize().width, getLabelSize().height)
        }
        if footer != nil && !isCleanedStringEmpty(footer!)
        {
            setFooterLabel(footer!)
            footerLabel!.frame = CGRectMake(0, 0, getLabelSize().width, getLabelSize().height)
        }
        setBackGround(self)
        if title != nil && !isCleanedStringEmpty(title!)
        {
            titleLabel!.frame.origin = getHeaderOrigin(backGroundView!)
            titleLabel?.adjustsFontSizeToFitWidth = true
            backGroundView?.addSubview(titleLabel!)
        }
        if footer != nil && !isCleanedStringEmpty(footer!)
        {
            footerLabel!.frame.origin = getFooterOrigin(backGroundView!)
            footerLabel?.adjustsFontSizeToFitWidth = true
            backGroundView?.addSubview(footerLabel!)
        }
        if (progressBar != nil && progressBar?.boolValue != nil && progressBar != false)
        {
            progressIndicator?.frame.origin = getIndicatorOrigin(backGroundView!, activityIndicatorView: progressIndicator!)
            backGroundView?.addSubview(progressIndicator!)
        }
        //timer = NSTimer.scheduledTimerWithTimeInterval(5, target:self, selector: Selector("hide"), userInfo: nil, repeats: true)
        view.addSubview(self)
    }

    // Show the loader added to the mentioned window with the provided title and footer texts
    func showInWindow(window : UIWindow, withHeader title : String?, andFooter footer : String?, progressBar pb: Bool?)
    {
        self.showInView(window, withHeader: title, andFooter: footer, progressBar: pb)
    }
    
    // Show the loader added to the mentioned view with no title and footer texts
    func showInView(view : UIView)
    {
        self.showInView(view, withHeader: nil, andFooter: nil, progressBar: nil)
    }
    
    // Show the loader added to the mentioned window with no title and footer texts
    func showInWindow(window : UIWindow)
    {
        self.showInView(window, withHeader: nil, andFooter: nil, progressBar: nil)
    }

    // Removes the loader from its superview
    func hide()
    {
        if self.superview != nil
        {
            self.removeFromSuperview()
            progressIndicator?.stopAnimating()
            //timer.invalidate()
        }
    }

    // MARK: -Set view properties
    
    private func setBackGround(view : UIView)
    {
        if backGroundView?.superview != nil
        {
            backGroundView?.removeFromSuperview()
            var aView = backGroundView?.viewWithTag(1001) as UIView?
            aView?.removeFromSuperview()
        }
        backGroundView = UIView(frame: getBackGroundFrame(self))
        backGroundView?.backgroundColor = UIColor.clearColor()
        var translucentView = UIView(frame: backGroundView!.bounds)
        translucentView.backgroundColor = backGroundColor
        translucentView.alpha = 0.85
        translucentView.tag = 1001;
        translucentView.layer.cornerRadius = 5.0
        backGroundView?.addSubview(translucentView)
        backGroundView?.layer.cornerRadius = 15.0
        self.addSubview(backGroundView!)
    }
    
    private func setIndicator()
    {
        if progressIndicator?.superview != nil
        {
            progressIndicator?.removeFromSuperview()
        }
        progressIndicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        progressIndicator?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        progressIndicator?.color = loaderColor
        progressIndicator?.backgroundColor = UIColor.clearColor()
        progressIndicator?.startAnimating()
    }
    
    private func setTitleLabel(text : String)
    {
        if titleLabel?.superview != nil
        {
            titleLabel?.removeFromSuperview()
        }
        titleLabel = UILabel()
        titleLabel?.text = text
        titleLabel?.font = self.boldFontWithFont(titleLabel?.font)
        titleLabel?.textColor = headerColor
        titleLabel?.textAlignment = .Center
    }
    
    private func setFooterLabel(text : String)
    {
        if footerLabel?.superview != nil
        {
            footerLabel?.removeFromSuperview()
        }
        footerLabel = UILabel()
        footerLabel?.text = text
        footerLabel?.textColor = footerColor
        footerLabel?.textAlignment = .Center
    }
    
    // MARK: -Get Frame
    private func getBackGroundFrame(view : UIView) -> CGRect
    {
        //let sideMargin:CGFloat = 20.0
        var side = progressIndicator!.frame.height //+ sideMargin
        if titleLabel?.text != nil && !isCleanedStringEmpty((titleLabel?.text)!)
        {
            side = progressIndicator!.frame.height + titleLabel!.frame.width
        }
        else if (footerLabel?.text != nil && !isCleanedStringEmpty((footerLabel?.text)!))
        {
            side = progressIndicator!.frame.height + footerLabel!.frame.width
        }
        var originX = view.center.x - (side/2)
        var originY = view.center.y - (side/2)
        return CGRectMake(originX, originY, side, side)
    }
    
    // MARK: Get Size
    private func getLabelSize() -> CGSize
    {
        var width = progressIndicator!.frame.width * 3
        var height = progressIndicator!.frame.height / 1.5
        return CGSizeMake(width, height)
    }
    
    // MARK: -Get Origin
    private func getIndicatorOrigin(view : UIView, activityIndicatorView indicator : UIActivityIndicatorView) -> CGPoint
    {
        var side = indicator.frame.size.height
        var originX = (view.bounds.width/2) - (side/2)
        var originY = (view.bounds.height/2) - (side/2)
        return CGPointMake(originX, originY)
    }
    
    private func getHeaderOrigin(view : UIView) -> CGPoint
    {
        var width = titleLabel!.frame.size.width
        var originX = (view.bounds.width/2) - (width/2)
        return CGPointMake(originX, 1)
    }
    
    private func getFooterOrigin(view : UIView) -> CGPoint
    {
        var width = footerLabel!.frame.width
        var height = footerLabel!.frame.height
        var originX = (view.bounds.width/2) - (width/2)
        var originY = view.frame.height - (height + 1)
        return CGPointMake(originX, originY)
    }
    
    private func isCleanedStringEmpty(string: String) -> Bool
    {
        let cleanString = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        return cleanString.isEmpty
    }
    
    // MARK: -Set Font
    func boldFontWithFont(font : UIFont?) -> UIFont
    {
        var fontDescriptor : UIFontDescriptor = font!.fontDescriptor().fontDescriptorWithSymbolicTraits(.TraitBold)!
        return UIFont(descriptor: fontDescriptor, size: 0)
    }
}
