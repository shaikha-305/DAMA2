//
//  main.swift
//  DAMA2
//
//  Created by shaikha aljenaidel on 10/5/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import Foundation
func fillTheArray(){
    for i in 1...64{
        checkers.append(Checker(location: i, type: .none))
    }
    for b in 9...24{
        checkers[b-1].type = .white
    }
    for w in 41...56{
        checkers[w-1].type = .black
    }
}
var checkers = [Checker]()
fillTheArray()
var input: Int
func canMove(player: Int)->Bool{
    if 1...64 ~= player{
        if checkers[player-1].type == .black || checkers[player-1].type == .white{
            return true
        }else{
            return false
        }
    }else{
        return false
    }
    
}

func printTable(){
    print("------------------------------------------------------------------------")
    for i in 1...64{
        if 1...9 ~= i{
        print(" \(checkers[i-1].location)    \(checkers[i-1].type.player) |", terminator: "")
        }else {
            print(" \(checkers[i-1].location)   \(checkers[i-1].type.player) |", terminator: "")
        }
        if i % 8 == 0{
            print("")
            print("------------------------------------------------------------------------")
        }
    }
}
func check(toCheck: [Int])->[Int]{
    var isEmpty = [Int]()
    for i in toCheck{
        if checkers[i-1].type == .none{
            isEmpty.append(i)
        }
    }
    return isEmpty
}
func firstAndLastColumn(player: Int)->[Int]{
    var f: Int
    var l: Int
    var r: Int
    if player % 8 == 0{
        switch checkers[player-1].type {
        case .black:
             f = (player-1)-8
             l = (player-1)-1
             return [f+1,l+1]
        case .white:
            f = (player-1)+8
            l = (player-1)-1
            return [f+1,l+1]
        default:
            return []
        }
    }else if (player-1) % 8 == 0{
        switch checkers[player-1].type {
        case .black:
             f = (player-1)-8
             r = (player-1)+1
             return [f+1,r+1]
        case .white:
            f = (player-1)+8
            r = (player-1)+1
            return [f+1,r+1]
        default:
            return []
        }
    }else{
        return []
    }
}
func anyOtherChecker(player: Int)->[Int]{
    var f: Int
    var l: Int
    var r: Int
    if checkers[player-1].type == .black{
        f = (player-1)-8
        l = (player-1)-1
        r = (player-1)+1
        return [f+1,l+1,r+1]
    }else{
        f = (player-1)+8
        l = (player-1)-1
        r = (player-1)+1
        return [f+1,l+1,r+1]
    }
}
func finalCheck(isValid: Bool, player: Int)->(String, [Int]){
    var validInputs = [Int]()
    if isValid{
        if player % 8 == 0 || (player-1) % 8 == 0{
            validInputs.append(contentsOf: check(toCheck: firstAndLastColumn(player: player)))
            return validInputs != [] ? ("\(player) can move to \(validInputs) ", validInputs) : ("this checker cant move :(", validInputs)
            
        }else{
            validInputs.append(contentsOf: check(toCheck: anyOtherChecker(player: player)))
            return validInputs != [] ? ("\(player) can move to \(validInputs) ", validInputs) : ("this checker cant move :(", validInputs)
        }
    }
    return ("⚠️ your input is invalid", [])
}
for _ in 0...64{
    printTable()
    print("👋🏻 Please type a number for a piece to move")
    input = Int(readLine()!)!
    var validPoints = finalCheck(isValid: canMove(player: input), player: input)
    print(validPoints.0)
    var movement = Int(readLine()!)!
    for i in validPoints.1{
        if movement == i{
            checkers[movement-1].type = checkers[input-1].type
            checkers[input-1].type = .none
        }else{
            print("You cant move this checker :(")
        }
    }
}

