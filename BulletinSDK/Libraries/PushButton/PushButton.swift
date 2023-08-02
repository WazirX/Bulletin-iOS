//
//  PushButton.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 21/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

open class PushButton: UIButton {
    
    // MARK: - Declarations
    public static let PUSH_BUTTON_DEFAULT_TOUCH_DOWN_DURATION: CGFloat = 0.22
    public static let PUSH_BUTTON_DEFAULT_TOUCH_DOWN_DELAY: CGFloat = 0.0
    public static let PUSH_BUTTON_DEFAULT_TOUCH_DOWN_DAMPING: CGFloat = 0.6
    public static let PUSH_BUTTON_DEFAULT_TOUCH_DOWN_VELOCITY: CGFloat = 0.0
    public static let PUSH_BUTTON_DEFAULT_TOUCH_UP_DURATION: CGFloat = 0.7
    public static let PUSH_BUTTON_DEFAULT_TOUCH_UP_DELAY: CGFloat = 0.0
    public static let PUSH_BUTTON_DEFAULT_TOUCH_UP_DAMPING: CGFloat = 0.65
    public static let PUSH_BUTTON_DEFAULT_TOUCH_UP_VELOCITY: CGFloat = 0.0
    
    
    // MARK: - Variables
    
    // Original Transform Property
    open var originalTransform = CGAffineTransform.identity {
        didSet  {
            // Update Button Transform
            transform = originalTransform
        }
    }
    
    // Set Highlight Property
    @IBInspectable open var highlightStateBackgroundColor: UIColor?
    
    // Push Transform Property
    @IBInspectable open var pushTransformScaleFactor: CGFloat = 0.8
    
    // Touch Handler Blocks
    open var touchDownHandler: ((_ button: PushButton) -> Void)?
    open var touchUpHandler: ((_ button: PushButton) -> Void)?
    
    // Push Transition Animation Properties
    @IBInspectable open var touchDownDuration: CGFloat = PUSH_BUTTON_DEFAULT_TOUCH_DOWN_DURATION
    @IBInspectable open var touchDownDelay: CGFloat = PUSH_BUTTON_DEFAULT_TOUCH_DOWN_DELAY
    @IBInspectable open var touchDownDamping: CGFloat = PUSH_BUTTON_DEFAULT_TOUCH_DOWN_DAMPING
    @IBInspectable open var touchDownVelocity: CGFloat = PUSH_BUTTON_DEFAULT_TOUCH_DOWN_VELOCITY
    
    @IBInspectable open var touchUpDuration: CGFloat = PUSH_BUTTON_DEFAULT_TOUCH_UP_DURATION
    @IBInspectable open var touchUpDelay: CGFloat = PUSH_BUTTON_DEFAULT_TOUCH_UP_DELAY
    @IBInspectable open var touchUpDamping: CGFloat = PUSH_BUTTON_DEFAULT_TOUCH_UP_DAMPING
    @IBInspectable open var touchUpVelocity: CGFloat = PUSH_BUTTON_DEFAULT_TOUCH_UP_VELOCITY
    
    // Add Extra Parameters
    open var extraParam: Any?
    
    private var normalStateBackgroundColor: UIColor?
    open override var backgroundColor: UIColor? {
        didSet  {
            // Store Normal State Background Color
            normalStateBackgroundColor = backgroundColor
        }
    }

    
    // MARK: - Initialization Methods
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        basicInitialisation()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        basicInitialisation()
    }
    
    open func basicInitialisation() {
        
        // Add Corner Curve
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        
        // Set Default Original Transform
        originalTransform = CGAffineTransform.identity
    }
    
    
    // MARK: - Touch Events
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        pushButton(pushButton: true, shouldAnimate: true, completion: nil)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        pushButton(pushButton: false, shouldAnimate: true, completion: nil)
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        pushButton(pushButton: false, shouldAnimate: true, completion: nil)
    }
    
    
    // MARK: - Animation Method
    open func pushButton(pushButton: Bool, shouldAnimate: Bool, completion: (() -> Void)?) {
        
        // Call Touch Events
        if pushButton {
            // Call Touch Down Handler
            if let touchDownHandler = touchDownHandler {
                touchDownHandler(self)
            }
        }
        else {
            // Call Touch Up Handler
            if let touchUpHandler = touchUpHandler {
                touchUpHandler(self)
            }
        }
        
        // Animation Block
        let animate: (() -> Void)? = {() -> Void in
            
            if pushButton {
                // Calculate Scale Factor For Current Frame
                let scaleFactor : CGFloat = self.pushTransformScaleFactor
                // Set Transform
                self.transform = self.originalTransform.scaledBy(x: scaleFactor, y: scaleFactor)
                // Update Background Color
                if (self.highlightStateBackgroundColor != nil) {
                    super.backgroundColor = self.highlightStateBackgroundColor
                }
            }
            else {
                // Set Transform
                self.transform = self.originalTransform
                // Set Background Color
                super.backgroundColor = self.normalStateBackgroundColor
            }
            // Layout
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
        
        if shouldAnimate {
            
            // Configure Animation Properties
            var duration: CGFloat
            var delay: CGFloat
            var damping: CGFloat
            var velocity: CGFloat
            if pushButton {
                duration = touchDownDuration
                delay = touchDownDelay
                damping = touchDownDamping
                velocity = touchDownVelocity
            }
            else {
                duration = touchUpDuration
                delay = touchUpDelay
                damping = touchUpDamping
                velocity = touchUpVelocity
            }
            
            DispatchQueue.main.async    {
                // Animate
                UIView.animate(withDuration: TimeInterval(duration), delay: TimeInterval(delay), usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [.curveEaseOut, .beginFromCurrentState, .allowUserInteraction], animations: {() -> Void in
                    animate!()
                }, completion: {(_ finished: Bool) -> Void in
                    if let completion = completion, finished {
                        completion()
                    }
                })
            }
        }
        else {
            animate!()
            
            // Call Completion Block
            if let completion = completion {
                completion()
            }
        }
    }
    
    
    // MARK: - Dealloc
    deinit {
        
        // Remove Touch Handlers
        touchDownHandler = nil
        touchUpHandler = nil
    }
}


