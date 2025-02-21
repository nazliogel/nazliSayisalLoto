import UIKit

class ViewController: UIViewController {

    // 6 adet UILabel, her biri bir sayıyı gösterecek
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar'ı kaldırmak için
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Arka planı gradient yapmak için
        setGradientBackground()
        
        // UILabel'ların stilini düzenleyelim
        styleLabels()
    }
    
    // Gradient arka plan fonksiyonu
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [
            UIColor.cyan.cgColor,
            UIColor.systemBlue.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }



    
    // 1-50 arasında 6 rastgele sayı üretme fonksiyonu
    func generateRandomNumbers() -> [Int] {
        var numbers: [Int] = []
        
        while numbers.count < 6 {
            let randomNumber = Int.random(in: 1...50)
            if !numbers.contains(randomNumber) {
                numbers.append(randomNumber)
            }
        }
        
        return numbers
    }
    
    // UILabel'ların stilini düzenleme
    func styleLabels() {
        let labels = [label1, label2, label3, label4, label5, label6]
        
        // Styling labels only if they are connected properly
        for label in labels {
            if let label = label {
                label.layer.cornerRadius = 10
                label.layer.borderWidth = 2
                label.layer.borderColor = UIColor.white.cgColor
                label.textColor = UIColor.white
                label.font = UIFont.boldSystemFont(ofSize: 24)
                label.textAlignment = .center
                label.clipsToBounds = true
            }
        }
    }

    // Sayı üret butonuna tıklanınca bu fonksiyon çalışacak
    @IBAction func generateNumbersButtonTapped(_ sender: UIButton) {
        let randomNumbers = generateRandomNumbers()
        
        // Sayıları etiketlere yerleştir
        label1.text = "\(randomNumbers[0])"
        label2.text = "\(randomNumbers[1])"
        label3.text = "\(randomNumbers[2])"
        label4.text = "\(randomNumbers[3])"
        label5.text = "\(randomNumbers[4])"
        label6.text = "\(randomNumbers[5])"
    }
}
