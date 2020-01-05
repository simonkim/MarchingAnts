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

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    weak var antsLayer: CALayer?
    weak var selectedView: UIView? {
        didSet {
            if let antsLayer = antsLayer {
                antsLayer.removeFromSuperlayer()
            }
            
            guard let selectedView = selectedView else {
                return
            }

            let antsLayer = MarchingAnts().boundingAnts(rect: imageView.bounds)
            selectedView.layer.addSublayer(
                antsLayer
            )
            self.antsLayer = antsLayer
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
        
        imageView.addGestureRecognizer(tapGesture)

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

