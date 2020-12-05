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
//  Match.swift
//  Assigment1_IOS
//
//  Created by Bui Manh Dai Duong on 11/13/20.
//



import Foundation

public class Match{
    var homeTeam: Club
    var awayTeam: Club
    var date: String
    var location: String
    var homeTeamGoal: Int
    var awayTeamGoal: Int
    
    init(homeTeam: Club, awayTeam: Club, date: String, location: String, homeTeamGoal: Int, awayTeamGoal: Int) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.date = date
        self.location = location
        self.homeTeamGoal = homeTeamGoal
        self.awayTeamGoal = awayTeamGoal
    }

}
