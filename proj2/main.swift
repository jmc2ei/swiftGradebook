/*
 Justin Cao
 Project 2
 Swift project to read text file and calculate student grades and averages
 */
import Foundation

//student class
class Student{
    fileprivate var studentID = ""
    fileprivate var cla = 0
    fileprivate var ola = 0
    fileprivate var quiz = 0
    fileprivate var exam = 0
    fileprivate var final = 0
    fileprivate var total = 0
    fileprivate var grade = ""
    //function to calculate Final Grade
    func calculateFinalGrade (){
        self.total = self.cla + self.ola + self.quiz + self.exam + self.final
        if total >= 90 {
            self.grade = "A"
        } else if total >= 87 {
            self.grade = "B+"
        } else if total >= 83 {
            self.grade = "B"
        } else if total >= 80 {
            self.grade = "B-"
        } else if total >= 77 {
            self.grade = "C+"
        } else if total >= 73 {
            self.grade = "C"
        } else if total >= 70 {
            self.grade = "C-"
        } else if total >= 67 {
            self.grade = "D+"
        } else if total >= 63 {
            self.grade = "D"
        } else if total >= 60 {
            self.grade = "D-"
        } else if total < 60 {
            self.grade = "F"
        } else {
            self.grade = "N/A"
        }
    }
}
//query function passes the search string, number of items, and student() objects
func query(searchId: String, items: Int, emptyArray: [Student]){
    let searchValue = searchId
    //forloop to iterate thought objects to find search id
    for num in 1...(items)
    {
        if (emptyArray[num-1].studentID == searchValue){
            print("\(emptyArray[num - 1].studentID) \(emptyArray[num - 1].cla) \(emptyArray[num - 1].ola) \(emptyArray[num - 1].quiz) \(emptyArray[num - 1].exam) \(emptyArray[num - 1].final) \(emptyArray[num - 1].total) \(emptyArray[num - 1].grade)")
            break
        }
    }
}
//calculate scores function
func calculateScores(passedArray: [Student], items: Int){
    var highValue = 0
    var total:Double = 0
    //for loop for cla
    for num in 1...(items)
    {
        if (passedArray[num-1].cla > highValue){
            highValue = passedArray[num-1].cla
        }
        total += Double(passedArray[num-1].cla)
    }
    total /= Double(items)
    print("Highest cla grade is: \(highValue)")
    print("Average cla grade is: \(total)")
    highValue = 0
    total = 0
    //for loop for ola
    for num in 1...(items)
    {
        if (passedArray[num-1].ola > highValue){
            highValue = passedArray[num-1].ola
        }
        total += Double(passedArray[num-1].ola)
    }
    total /= Double(items)
    print("Highest ola grade is: \(highValue)")
    print("Average ola grade is: \(total)")
    highValue = 0
    total = 0
    //forloop for quizzes
    for num in 1...(items)
    {
        if (passedArray[num-1].quiz > highValue){
            highValue = passedArray[num-1].quiz
        }
        total += Double(passedArray[num-1].quiz)
    }
    total /= Double(items)
    print("Highest quiz grade is: \(highValue)")
    print("Average quiz grade is: \(total)")
    highValue = 0
    total = 0
    //for loop for exams
    for num in 1...(items)
    {
        if (passedArray[num-1].exam > highValue){
            highValue = passedArray[num-1].exam
        }
        total += Double(passedArray[num-1].exam)
    }
    total /= Double(items)
    print("Highest exam grade is: \(highValue)")
    print("Average exam grade is: \(total)")
    highValue = 0
    total = 0
    //for loop for final exam
    for num in 1...(items)
    {
        if (passedArray[num-1].final > highValue){
            highValue = passedArray[num-1].final
        }
        total += Double(passedArray[num-1].final)
    }
    total /= Double(items)
    print("Highest finalexam grade is: \(highValue)")
    print("Average finalexam grade is: \(total)")
    highValue = 0
    total = 0
}





do {
    //takes users input for path of data file with readLine()
    print("What is path of the data file:")
    let path = readLine()
    
    // Read an entire text file into an NSString.
    let contents = try NSString(contentsOfFile: path!,
                                encoding: String.Encoding.ascii.rawValue)
    
    //covert contents of file to string
    let characters = contents as String
    
    //takes contents and filters out \r\n new lines and such
    var lineOfData = characters.components(separatedBy:"\r\n")
    //remove extra elements
    lineOfData.remove(at: 0)
    lineOfData.remove(at: ((lineOfData.count)-1))
    
    
    //initializing of student() object holder and for loop to add elements to append
    var studentContainer:[Student] = []
    for num in 1...(lineOfData.count){
        studentContainer.append(Student())
        
    }
    //initializing second string array to help assign properties to student() objects using for loop
    var  stringContainer = [[String]]()
    for num in 1...(lineOfData.count){
        let str = lineOfData[num-1]
        let component = str.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let list = component.filter({ $0 != "" }) // filter out all the empty strings in the component
        stringContainer.append(list)
        studentContainer[num - 1].studentID = ("c\(stringContainer[num-1][0])")
        studentContainer[num - 1].cla = Int(stringContainer[num-1][1])!
        studentContainer[num - 1].ola = Int(stringContainer[num-1][2])!
        studentContainer[num - 1].quiz = Int(stringContainer[num-1][3])!
        studentContainer[num - 1].exam = Int(stringContainer[num-1][4])!
        studentContainer[num - 1].final = Int(stringContainer[num-1][5])!
        studentContainer[num - 1].calculateFinalGrade()
    }
    
    
    
    //block for first query with function call
    print("Please input first query:")
    let queryOne = readLine()
    query(searchId : queryOne!, items : lineOfData.count, emptyArray : studentContainer)
    //block for second query
    print("Please input second query:")
    let queryTwo = readLine()
    query(searchId : queryTwo!, items : lineOfData.count, emptyArray : studentContainer)
    
    //block to print all student data after querys
    print("C#   CLA OLA Quiz Exam Final Total Grade")
    for num in 1...lineOfData.count{
        print("\(studentContainer[num - 1].studentID) \(studentContainer[num - 1].cla) \(studentContainer[num - 1].ola) \(studentContainer[num - 1].quiz) \(studentContainer[num - 1].exam) \(studentContainer[num - 1].final) \(studentContainer[num - 1].total) \(studentContainer[num - 1].grade)")
    }
    //call to calculate highest grade of each catagory and also get average
    calculateScores(passedArray: studentContainer, items: lineOfData.count)
}

