import Foundation

class MatrixRain {

    private var selectedList: String

    init(selectedList:String){
        self.selectedList=selectedList
    }

    
    func run() {

         let fileURL = URL(fileURLWithPath: "MatrixRain_Swift.txt")
        
         if !FileManager.default.fileExists(atPath: fileURL.path) {
            FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
        }
        
         let file = try! FileHandle(forWritingTo: fileURL)
       
            

        let letterCount = selectedList.count
            
        for _ in 1...20 {
            var row = ""
            for _ in 1...200 {
                let randomIndex = Int.random(in: 0..<letterCount)
                let randomCharacter = selectedList[selectedList.index(selectedList.startIndex, offsetBy: randomIndex)]
                row += "\(randomCharacter)"
                    
            }
                
            Thread.sleep(forTimeInterval: 0.5)

            print("\u{1B}[0;32m\(row)\n", terminator: "")

            file.write(row.data(using: .utf8)!)
            file.write("\r".data(using: .utf8)!)
            }
            
            
        
    }
}

func main()
{
    var selectedList:String=""

    var choice:String?

   while choice == nil {
        print("Unesite 'A' za matrix rain sa sljedećim znakovima: [| I l] \nUnesite 'B' za matrix rain za sljedećim znakovima: [0 1 2 3 4 5 6 7 8 9] \nUnesite 'C' za matrix rain sa sljedećim znakovima: [! @ # $ %  ^ & * () - _ + ={ } [ ] | ; ' : ']",
        "\nUnesite 'D' za matrix rain sa sljedećim znakovima: [0 1]\nVaš odabir: ", terminator:"")
        
        choice = readLine(strippingNewline: true)?.uppercased()
        
        switch choice {
        case "A":
            selectedList = " |       I     l   ' '"
        case "B":
            selectedList = "0  1  2    3    4   5   6 7  8  9"
        case "C":
             selectedList = "!    @      #     $ %      ^      &   * ()     - _ +  ={  }  [  ]  |  ; ' :   "
        case "D":
             selectedList = "0                              1"    
        default:
            choice = nil
        }
    }

    let rain = MatrixRain(selectedList:selectedList)
    rain.run()

}

main()

