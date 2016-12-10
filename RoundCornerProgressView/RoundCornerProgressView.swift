//
//  RoundCornerProgressView.swift
//  PhucNguyen
//
//  Created by Phuc Nguyen on 8/18/16.
//  Copyright © 2016 Phuc Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
public class RoundCornerProgressView: UIView {
    
    // MARK: Public properties
    
    public let progressLabel = UILabel(frame: .zero)
    
    // MARK: Private properties
    
    private let trackView = UIView(frame: .zero)
    private let progressView = UIView(frame: .zero)
    
    // MARK: Inspectable properties
    
    @IBInspectable public var shouldDisplayProgressLabel: Bool = true {
        didSet {
            progressLabel.isHidden = !shouldDisplayProgressLabel
        }
    }
    
    @IBInspectable public var labelColor: UIColor = UIColor.black {
        didSet {
            progressLabel.textColor = labelColor
        }
    }
    
    @IBInspectable public var labelFont: UIFont = UIFont.systemFont(ofSize: 10) {
        didSet {
            progressLabel.font = labelFont
        }
    }
    
    @IBInspectable public var trackRoundCorners: UIRectCorner = [.topRight, .bottomRight, .topLeft, .bottomLeft] {
        didSet {
            trackView.roundCorner(roundingCorners: trackRoundCorners, cornerRadius: CGSize(width: frame.size.height / 2, height: frame.size.height / 2))
            
        }
    }
    
    @IBInspectable public var progressRoundCorners: UIRectCorner = [] {
        didSet {
            progressView.roundCorner(roundingCorners: progressRoundCorners, cornerRadius: CGSize(width: frame.size.height / 2, height: frame.size.height / 2))
        }
    }
    
    @IBInspectable public var trackTintColor: UIColor = UIColor.lightGray {
        didSet {
            trackView.backgroundColor = trackTintColor
        }
    }
    
    @IBInspectable public var progressTintColor: UIColor = UIColor.red {
        didSet {
            progressView.backgroundColor = progressTintColor
        }
    }
    
    @IBInspectable public var progress: CGFloat = 0.3 {
        didSet {
            progress = max(0, min(1, progress))
            progressView.frame = CGRect(origin: progressView.frame.origin, size: CGSize(width: frame.width * progress, height: frame.height))
            progressView.roundCorner(roundingCorners: progressRoundCorners, cornerRadius: CGSize(width: frame.size.height / 2, height: frame.size.height / 2))
            progressLabel.text = String(format: "%d%%", Int(progress * 100))
        }
    }
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        setupSubviews()
    }
    
    // MARK: - Setup views
    
    private func setupSubviews() {
        setupTrackView()
        setupProgressView()
        setupProgressLabel()
    }
    
    private func setupTrackView() {
        trackView.frame = CGRect(origin: .zero, size: CGSize(width: frame.width - 2, height: frame.height))
        trackView.roundCorner(roundingCorners: trackRoundCorners, cornerRadius: CGSize(width: frame.size.height / 2, height: frame.size.height / 2))
        trackView.backgroundColor = trackTintColor
        trackView.clipsToBounds = true
        addSubview(trackView)
    }
    
    private func setupProgressView() {
        progressView.frame = CGRect(origin: .zero, size: CGSize(width: frame.width * progress, height: frame.height))
        progressView.roundCorner(roundingCorners: progressRoundCorners, cornerRadius: CGSize(width: frame.size.height / 2, height: frame.size.height / 2))
        progressView.backgroundColor = progressTintColor
        trackView.addSubview(progressView)
    }
    
    private func setupProgressLabel() {
        progressLabel.frame = CGRect(origin: .zero, size: CGSize(width: frame.width, height: frame.height))
        progressLabel.textAlignment = .center
        bringSubview(toFront: progressLabel)
        progressLabel.center = CGPoint(x: frame.width / CGFloat(2), y: frame.height / CGFloat(2))
        progressLabel.text = String(format: "%d%%", Int(progress * 100))
        progressLabel.textColor = labelColor
        progressLabel.isHidden = !shouldDisplayProgressLabel
        progressLabel.font = labelFont
        addSubview(progressLabel)
    }
}
