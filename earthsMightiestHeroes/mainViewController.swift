//
//  mainViewController.swift
//  earthsMightiestHeroes
//
//  Created by Bheki Maenetja on 2019/07/14.
//  Copyright © 2019 Oxford Royale Academy. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Avengers-10.jpg"
        // Do any additional setup after loading the view.
    }

// Variables for the image view and the search bar
    @IBOutlet weak var imageContainer: UIImageView!
    
    @IBOutlet weak var heroSearchField: UITextField!

// The search functions that run upon searching the entered text

    @IBAction func heroSearchBar(_ sender: UITextField) {
        var searchString = heroSearchField.text
        searchString = searchString?.lowercased()
        heroSearchHandler(searchString!)
    }
    
    func heroSearchHandler(_ searchString: String) {
        switch searchString {
        case "iron man", "iron-man", "iron", "stark", "tony stark":
            self.title = "Iron-Man.jpg"
            imageContainer.image = UIImage(named: "Iron-Man.jpg")
        case "thor", "odinson", "thor odinson", "god of thunder":
            self.title = "Thor-3.png"
            imageContainer.image = UIImage(named: "Thor-3.png")
        case "captain", "caotain america", "captain-america", "cap", "steve rogers":
            self.title = "Captain-America.jpg"
            imageContainer.image = UIImage(named: "Captain-America.jpg")
        case "hulk", "banner", "the hulk", "bruce banner":
            self.title = "Hulk.jpg"
            imageContainer.image = UIImage(named: "Hulk.jpg")
        case "spider man", "spider-man", "spiderman", "spidey", "peter parker", "spider":
            self.title = "Spiderman-13.jpg"
            imageContainer.image = UIImage(named: "Spiderman-13.jpg")
        case "the black panther", "black-panther", "t'challa", "black panther", "panther":
            self.title = "Black-Panther-3.jpg"
            imageContainer.image = UIImage(named: "Black-Panther-3.jpg")
        case "ant man", "ant-man":
            self.title = "Ant-Man.jpg"
            imageContainer.image = UIImage(named: "Ant-Man.jpg")
        case "black widow", "black-widow", "widow", "the black widow":
            self.title = "Black-Widow.jpg"
            imageContainer.image = UIImage(named: "Black-Widow.jpg")
        case "captain marvel", "captain-marvel", "marvel":
            self.title = "Captain-Marvel.jpg"
            imageContainer.image = UIImage(named: "Captain-Marvel.jpg")
        case "falcon", "the falcon", "sam wilson":
            self.title = "Falcon.jpg"
            imageContainer.image = UIImage(named: "Falcon.jpg")
        case "hawkeye", "hawk", "the hawk", "the hawkeye":
            self.title = "Hawkeye.jpg"
            imageContainer.image = UIImage(named: "Hawkeye.jpg")
        case "vision", "the vision", "vis":
            self.title = "Vision.png"
            imageContainer.image = UIImage(named: "Vision.png")
        case "war machine", "war-machine", "james rhodes", "rhodey":
            self.title = "War-Machine.jpg"
            imageContainer.image = UIImage(named: "War-Machine.jpg")
        case "doctor strange", "stephen strange", "mr strange", "mr doctor", "strange", "doctor":
            self.title = "Doctor-Strange.jpg"
            imageContainer.image = UIImage(named: "Doctor-Strange.jpg")
        default:
            self.title = "image-not-found.png"
            imageContainer.image = UIImage(named: "image-not-found.png")
        }
    }

// The buttons that allow a user to display their selected image

    @IBAction func resetAvengers(_ sender: Any) {
        imageContainer.image = UIImage(named: self.title!)
    }
    @IBAction func displayIronMan(_ sender: Any) {
        imageContainer.image = UIImage(named: "Iron-Man.jpg")
        self.title = "Iron-Man.jpg"
        heroSearchField.text = "Iron Man"
    }
    @IBAction func displayThor(_ sender: Any) {
        imageContainer.image = UIImage(named: "Thor-3.png")
        self.title = "Thor-3.png"
        heroSearchField.text = "Thor"
    }
    @IBAction func displayCaptainAmerica(_ sender: Any) {
        imageContainer.image = UIImage(named: "Captain-America.jpg")
        self.title = "Captain-America.jpg"
        heroSearchField.text = "Captain America"
    }
    @IBAction func displayHulk(_ sender: Any) {
        imageContainer.image = UIImage(named: "Hulk.jpg")
        self.title = "Hulk.jpg"
        heroSearchField.text = "Hulk"
    }
    @IBAction func displaySpidey(_ sender: Any) {
        imageContainer.image = UIImage(named: "Spiderman-13.jpg")
        self.title = "Spiderman-13.jpg"
        heroSearchField.text = "Spiderman"
    }
    @IBAction func displayBlackPanther(_ sender: Any) {
        imageContainer.image = UIImage(named: "Black-Panther-3.jpg")
        self.title = "Black-Panther-3.jpg"
        heroSearchField.text = "The Black Panther"
    }

//  Image Filters

    @IBAction func filterSepia(_ sender: Any) {
        let chosenImage = UIImage(named: self.title!)
        let sepiaImage = CIImage(image: chosenImage!)
        let newImage = mySepia(sepiaImage!, intensity: 1.0)
        self.imageContainer.image = UIImage(ciImage: newImage!)
    }
    
    func mySepia(_ input: CIImage, intensity: Double) -> CIImage? {
        let sepiaFilter = CIFilter(name: "CISepiaTone")
        sepiaFilter?.setValue(input, forKey: kCIInputImageKey)
        sepiaFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        return sepiaFilter?.outputImage
    }
    
    @IBAction func filterBloom(_ sender: Any) {
        let chosenImage = UIImage(named: self.title!)
        let bloomImage = CIImage(image: chosenImage!)
        let newImage = myBloom(bloomImage!, intensity: 1.0)
        self.imageContainer.image = UIImage(ciImage: newImage!)
    }
    
    func myBloom(_ input: CIImage, intensity: Double) -> CIImage? {
        let sepiaFilter = CIFilter(name: "CIBloom")
        sepiaFilter?.setValue(input, forKey: kCIInputImageKey)
        sepiaFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        return sepiaFilter?.outputImage
    }
    
    @IBAction func filterVignette(_ sender: Any) {
        let chosenImage = UIImage(named: self.title!)
        let vignetteImage = CIImage(image: chosenImage!)
        let newImage = myVignette(vignetteImage!, intensity: 2.0)
        self.imageContainer.image = UIImage(ciImage: newImage)
    }
    
    func myVignette(_ input: CIImage, intensity: Double) -> CIImage {
        let vignetteFilter = CIFilter(name: "CIVignette")
        vignetteFilter?.setValue(input, forKey: kCIInputImageKey)
        vignetteFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        return (vignetteFilter?.outputImage)!
    }
    
    @IBAction func filterGloom(_ sender: Any) {
        let chosenImage = UIImage(named: self.title!)
        let gloomImage = CIImage(image: chosenImage!)
        let newImage = myGloom(gloomImage!, intensity: 1.0)
        self.imageContainer.image = UIImage(ciImage: newImage)
    }
    
    func myGloom(_ input: CIImage, intensity: Double) -> CIImage {
        let gloomFilter = CIFilter(name: "CIGloom")
        gloomFilter?.setValue(input, forKey: kCIInputImageKey)
        gloomFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        return (gloomFilter?.outputImage)!
    }
    
    @IBAction func filterInvert(_ sender: Any) {
        let chosenImage = UIImage(named: self.title!)
        let invertImage = CIImage(image: chosenImage!)
        let newImage = myInvert(invertImage!)
        self.imageContainer.image = UIImage(ciImage: newImage)
    }
    
    func myInvert(_ input: CIImage) -> CIImage {
        let invertFilter = CIFilter(name: "CIColorInvert")
        invertFilter?.setValue(input, forKey: kCIInputImageKey)
        return (invertFilter?.outputImage)!
    }
    
    @IBAction func filterComicBook(_ sender: Any) {
        let chosenImage = UIImage(named: self.title!)
        let comicImage = CIImage(image: chosenImage!)
        let newImage = myComicBook(comicImage!)
        self.imageContainer.image = UIImage(ciImage: newImage)
    }
    
    func myComicBook(_ input: CIImage) -> CIImage {
        let comicFilter = CIFilter(name: "CIComicEffect")
        comicFilter?.setValue(input, forKey: kCIInputImageKey)
        return (comicFilter?.outputImage)!
    }

// The Save Function
    @IBAction func saveImage(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(imageContainer.image!, nil, nil, nil)
    }

}
