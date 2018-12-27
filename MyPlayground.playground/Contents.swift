import UIKit

var str = "Hello, playground"

//####################################################################
//常數與變數（contant and variable)
//####################################################################

//***let 宣告常數,用var 宣告變數***
let constant = 10 //用 let 宣告常數
var y = 10 //用var 宣告變數
var x = y + constant

var number = 10
var result = constant+number

//***常數與變數的差異***
//常數：以一個值來初始化=>不能改變它
//變數：可以改變
//constant = 20 -> 會出錯
number = 50

//####################################################################
//了解型態推論
//####################################################################

//***宣告型態 var/let 名稱:型態 = 值
let constant1:Int = 10
var number1:Int = 10
var result1:Int = number1+constant1

var number2: Double = 10.5

//***型態推論***
//swift的compiler可以推斷型態
//按住option選擇變數就會出現其型態

//####################################################################
//文字的處理
//####################################################################

var message = "The best way to get started is to stop talking and code."

var greeting = "Hello"
var name = "Siman"
var messages = greeting + name

//文字轉成大寫
message.uppercased()
//文字轉成小寫
message.lowercased()
//計算有幾個字元
message.count


var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies

//***Swift 是安全型態(type-safe)=>每一個變數都要有一個型態
//*** +的運算：兩個型態要一樣
//var totalPriceMessage = "The price of the book is $" + totalPrice
var totalPriceMessage = "The price of the book is $" + String(totalPrice)

//***字串插值(String Interpolations)***
var totalPriceMessage1 = "The price of the book is $ \(totalPrice)"

//####################################################################
//流程控制
//####################################################################

//if-else
var timeYouWakeUp = 6

if timeYouWakeUp == 6 {
    print("Cook yourself a big breakfast!")
} else {
    print("Go out for breakfast")
}

//switch
var timeYouWakeUp1 = 6

switch timeYouWakeUp1 {
case 6: //timeYouWakeUp1的值與case做比對
    print("Cook yourself a big breakfast!")
default: //如果值不相符,default的case會被運行
    print("Go out for breakfast")
}

//運算子
var bonus = 5000

if bonus >= 10000 { // >= ：比較運算子(comparison operator) 大於等於
    print("I will travel to Paris and London!")
} else if bonus >= 5000 && bonus < 10000 { //同時要兩種條件 &&
    print("I will travel to Tokyo")
} else if bonus >= 1000 && bonus < 5000 {
    print("I will travel to Bangkok")
} else {
    print("Just stay home")
}


//switch改寫上例
var bonus1 = 5000

switch bonus1 {
case 10000...: //...是範圍運算子,表10000以上的值
    print("I will travel to Paris and London!")
case 5000...9999://5000至9999的值
    print("I will travel to Tokyo")
case 1000...4999:
    print("I will travel to Bangkok")
default:
    print("Just stay home")
}

//####################################################################
//Array 與 字典
//####################################################################


//***Array***
//必須要是相同的型態
//有排序
var bookCollection = ["Tool of Titans", "Rework", "Your Move"]

bookCollection[0]//陣列的第一個項目
bookCollection.append("Authority")//新的項目至陣列中
bookCollection.count//陣列的全部數

//***for-in 迴圈***
//在特定範圍內做迭代(iterate)
for index in 0...3 {//index的值會在範圍1至3之間做改變
    print(bookCollection[index])
}

//範圍的上限等於全部項目數-1
for index in 0...bookCollection.count - 1 {
    print(bookCollection[index])
}

//陣列（也就是 bookCollection ）被迭代後，每一次迭代的項目會被設定給 book 常數
for book in bookCollection {
    print(book)
}


//***字典(dictionary)***
//key-value
//無排序
var bookCollectionDict = ["1328683788": "Tool of Titans", "0307463745": "Rework", "1612060919": "Authority"]

//存取一個特定的項目
bookCollectionDict["0307463745"]

//迭代字典中的所有項目
for (key, value) in bookCollectionDict {
    print("ISBN: \(key)")
    print("Title: \(value)")
}


//表情符號的型態是String
var emojiDict = ["👻":"Ghost",
                 "💩":"Poop",
                 "😡":"Angry",
                 "😱":"Scream",
                 "👾":"Alien monster"]

var wordToLookup = "👻"
var meaning = emojiDict[wordToLookup]
//print(meaning)
//應修改成以下
if let meaning = meaning{
    print(meaning)
}

wordToLookup = "✌🏻"
meaning = "yeah"
//print(meaning)

//上述例子的print(meaning)會有黃色警告,輸出結果為Optional("Ghost")\n

//####################################################################
//Optional
//####################################################################

//前言：為什麼App會發生閃退？
//因為：運行期間，App試著要存取一個沒有值的變數，所以便發生了這個例外事件。

//非optional的值要有初始值

//***optional***
//1.Swift 中的一個型態
//2.型態定義：一個變數可以有指定值或沒有值
//3.清楚地指定它的型態
//4.如何宣告：在變數後面加上個問號（ ? ）
var jobTitle: String? //nil

//***nil***
//表示變數沒有值
jobTitle = "iOS Developer"

//使用optional 變數之前要先做個檢查
//var message = "Your job title is " + jobTitle//有錯誤

//***使用Optional變數***
//法1. if 敘述與強迫解除
if jobTitle != nil { //!= 運算子表示「不等於」
    _  = "Your job title is " + jobTitle! //! ：特別的指示符號,告訴 Xcode,這個optional 變數有個值
}

//法2.Optional Binding
//如果jobTitle有值,則jobTitle的值指定給jobTitleWithValue
if let jobTitleWithValue = jobTitle {
    _ = "Your job title is " + jobTitleWithValue
}
//上下含義相等
//可以使用一樣的變數名
if let jobTitle = jobTitle {
    _ = "Your job title is " + jobTitle
}


//####################################################################
//UI
//####################################################################


var emojiDict1 = ["👻":"Ghost",
                  "💩":"Poop",
                  "😡":"Angry",
                  "😱":"Scream",
                  "👾":"Alien monster"]

var wordToLookup1 = "👻"
var meaning1 = emojiDict1[wordToLookup1]

//實例化（ instantiate）一個 UIView 物件
//做為background
let containerView = UIView(frame: (CGRect(x: 0, y: 0, width: 300, height: 300)))
containerView.backgroundColor = UIColor.orange

//實例化（ instantiate）一個 UILabel 物件
//在上一個UIView物件中加入圖示
let emojiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

//加入圖示
containerView.addSubview(emojiLabel)

//實例化（ instantiate）一個 UILabel 物件
let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = meaning
meaningLabel.font = UIFont.systemFont(ofSize: 30.0)
meaningLabel.textColor = UIColor.white

//加入文字
containerView.addSubview(meaningLabel)
