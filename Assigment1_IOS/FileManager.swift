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
//  FileManager.swift
//  Assigment1_IOS
//
//  Created by Bui Manh Dai Duong on 11/13/20.
//

import Foundation

public class FileManager{
//read csv file and return valid data
 internal func readFile(URL: String, fileType: String)-> [String]?{
    if let path = Bundle.main.url(forResource: URL, withExtension: fileType) {
        do {
            let data = try String(contentsOf: path, encoding: .utf8)
            return data.components(separatedBy:.newlines)
        } catch {
            print("Error file or invalid !!!")
            return nil
        }
    }else{
        return nil
    }
}

// provide match data to match list
 internal func provideMatchData(matchData: inout [String], listClub: [String:Club]) -> [Match] {
    var matchList:[Match] = []
    matchData.remove(at: 0)
    for row in matchData{
        let valueRow = row.components(separatedBy: ",")
              //assign homeTeam and awayTeam
              if !valueRow.isEmpty && !valueRow[valueRow.count-1].isEmpty{
                  let homeTeam = listClub[valueRow[3]]!
                  let awayTeam = listClub[valueRow[4]]!
                
                  // variable goals for both team
                  let tempList = valueRow[5].components(separatedBy: " - ")
                  let homeTeamGoal = Int(tempList[0])!
                  let awayTeamGoal = Int(tempList[1])!
                
                  // variable for location match
                  let location = valueRow[2]
                
                  // variable  for date match
                  let date = valueRow[1]
                  
                  //provide new match to match list
                  matchList.append(Match(homeTeam: homeTeam, awayTeam: awayTeam, date: date, location: location, homeTeamGoal: homeTeamGoal, awayTeamGoal: awayTeamGoal))
                  
              }
    }
    return matchList
}

  
// update to club if won
internal func updateWinResult(team: Club){
        team.matchesWon += 1
        if(team.lastFiveMatches.count >= 5){
            team.lastFiveMatches.remove(at: 0);
            team.lastFiveMatches.append("\u{2705}")
        }else{
            team.lastFiveMatches.append("\u{2705}")
        }
    }
    
// update to club if Lost
internal func updateLostResult(team: Club){
        team.matchesLost += 1
        if(team.lastFiveMatches.count >= 5){
            team.lastFiveMatches.remove(at: 0);
            team.lastFiveMatches.append("\u{274C}")
        }else{
            team.lastFiveMatches.append("\u{274C}")
        }
    }
    
// update to club if drawn
 internal func updateDrawnResult(team: Club){
        team.matchesDrawn += 1
        if(team.lastFiveMatches.count >= 5){
            team.lastFiveMatches.remove(at: 0);
            team.lastFiveMatches.append("\u{2796}")
        }else{
            team.lastFiveMatches.append("\u{2796}")
        }
    }
    
    
//provide team data from list match
 internal func updateInfoToTeams( listMatch: [Match]){
    for match in listMatch{
        let homeTeam = match.homeTeam
        let awayTeam = match.awayTeam
        // variable score for both team
        let homeTeamGoal = match.homeTeamGoal
        let awayTeamGoal = match.awayTeamGoal
            
            //update match playeded
            homeTeam.matchesPlayed += 1
            awayTeam.matchesPlayed += 1
            
            //update goalFor and goalAgainst
            homeTeam.goalFor += homeTeamGoal
            homeTeam.goalAgainst += awayTeamGoal
            
            awayTeam.goalFor += awayTeamGoal
            awayTeam.goalAgainst += homeTeamGoal
        
            //update matchesWon, matchesDrawn, matchesLost and Las Five Matches for each team
            if( homeTeamGoal > awayTeamGoal){
             updateWinResult(team: homeTeam)
             updateLostResult(team: awayTeam)
            }else if(homeTeamGoal < awayTeamGoal){
             updateWinResult(team: awayTeam)
             updateLostResult(team: homeTeam)
            }else{
             updateDrawnResult(team: homeTeam)
             updateDrawnResult(team: awayTeam)
        }
    }
}
   
}

