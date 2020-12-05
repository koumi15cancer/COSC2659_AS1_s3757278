/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2020C
  Assessment: Assignment 1
  Author: Bui Manh Dai Duong
  ID: s3757278
  Created  date:13/11/2020
  Last modified:15/11/2020
  Acknowledgement: Acknowledge the resources that you use here.
 
*/

//
//  Club.swift
//  Assigment1_IOS
//
//  Created by Bui Manh Dai Duong on 11/13/20.
//



import Foundation

public class Club {
    var name: String
    var matchesPlayed: Int = 0
    var matchesWon: Int = 0
    var matchesLost: Int = 0
    var matchesDrawn: Int = 0
    var goalFor: Int = 0
    var goalAgainst: Int = 0
    var goalDifference: Int {
        return self.goalFor - self.goalAgainst
    }
    var points: Int {
        return self.matchesWon * 3 + self.matchesDrawn
    }
    
    var lastFiveMatches: [String] = []
    
    init(_ name:String) {
        self.name = name
    }
    
    // get last five matches
  internal func getLastFivematches()->String{
        var temp = String()
             for index in stride(from: self.lastFiveMatches.endIndex - 1, to: self.lastFiveMatches.startIndex - 1, by: -1){
                 temp += self.lastFiveMatches[index] + " "
             }
             return temp
    }
    
    // print club data
   internal func returnClubData(){
        let ClubData  = "\(self.name)".withCString{
            String(format:  "%-20s %3d %5d %3d %3d %4d %3d %3d %4d \t\t%@", $0,self.matchesPlayed, self.matchesWon, self.matchesDrawn, self.matchesLost, self.goalFor, self.goalAgainst, self.goalDifference,
                   self.points, getLastFivematches())
        }
        print(ClubData);
    }
    
    // update matches results and last five matches
   
}
