//
//  ViewController.swift
//  MarchingAntsSample
//
//  Created by Simon Kim on 2020/01/05.
//  Copyright © 2020 DZPub.com. All rights reserved.
//

import UIKit
import MarchingAnts

extension UIImageView {
    func fetchRemoteImage(url: URL, completion: @escaping (_ imageView: UIImageView, _ image: UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(self, nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(self, UIImage(data: data))
            }
        }
        task.resume()
    }
}

/// Try tapping `label` or `imageView` to see marching ants as selection state visualization
class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var tapImageGesture: UITapGestureRecognizer!
    @IBOutlet var tapLabelGesture: UITapGestureRecognizer!
    
    weak var selectedView: UIView? {
        didSet(oldValue) {
            
            if let oldView = oldValue {
                oldView.layer.isMarchingAntsVisible = false
            }
            if let selectedView = selectedView {
                selectedView.layer.isMarchingAntsVisible = true
            }
        }
    }
    
    let text = "Tap me"
    var placerImageURL: URL {
        return URL(
            string: "https://via.placeholder.com/320.png/09f/00000000/?text="
                + text.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
            )!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedView = label

        label.addGestureRecognizer(tapLabelGesture)
        imageView.addGestureRecognizer(tapImageGesture)

        imageView.fetchRemoteImage(url: placerImageURL) { imageView, image in
            imageView.image = image
        }
    }
    
    @IBAction func didTap(_ sender: UIGestureRecognizer) {
        guard let view = sender.view else { return }
        
        if selectedView == view {
            selectedView = nil
            return
        }
        selectedView = view
    }
}

