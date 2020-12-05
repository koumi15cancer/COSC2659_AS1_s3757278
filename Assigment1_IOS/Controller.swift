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
//  Controller.swift
//  Assigment1_IOS
//
//  Created by Bui Manh Dai Duong on 11/13/20.
//

import Foundation
public class Controller{
    
internal func run(){
    // dictionary to store Club name
    let listNameClub = ["Fulham", "Arsenal", "Crystal Palace", "Southampton", "Liverpool", "Leeds",
    "West Ham", "Newcastle", "West Brom", "Leicester", "Spurs", "Everton", "Sheffield Utd", "Wolves",
    "Brighton", "Chelsea", "Man Utd", "Man City", "Burnley", "Aston Villa"]

    let manager = FileManager()
    
    //Club instances based on list of Name Club and add into listClub
    var listClub: [String:Club] = [:]
    for value in listNameClub{
        listClub[value] = Club(value)
    }

    //Read File datafile.csv
    var matchInfoList = manager.readFile(URL: "datafile", fileType: "csv")!

    //List match from data and listClub
    let listMatch = manager.provideMatchData(matchData: &matchInfoList, listClub: listClub)

    //update match data to each Club
    manager.updateInfoToTeams(listMatch: listMatch)


    //Display title for Club results
    let displayColumnTable = "Club".withCString{
        String(format: "%-22s %@\t %@\t %@\t %@\t %@\t %@\t %@\t %@\t\t%@", $0, "MP","W","D","L","GF","GA","GD","Pts", "Last 5 matches")
    }
    print(displayColumnTable);

    //sort list Club based on points
    let sortedListTeam = listClub.sorted(by: {(arg0, arg1) -> Bool in
        let (_, valueTeamA) = arg0
        let (_, valueTeamB) = arg1
        return valueTeamA.points > valueTeamB.points
    })

    //display information for each team
    for team in sortedListTeam{
        team.value.returnClubData()
    }

 }
    
}
