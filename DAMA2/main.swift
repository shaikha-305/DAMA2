//
//  main.swift
//  DAMA2
//
//  Created by shaikha aljenaidel on 10/5/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import Foundation
enum Type{
    case none, black, white
    var player: String{
        switch self{
        case .none: return " "
        case .black: return "♟"
        case .white: return "♙"
        }
    }
}

struct Checker{
    var location: Int
    var type: Type
}
var checkers = [Checker]()
fillTheArray()
//printTable()
var input: Int
func canMove(player: Int)->Bool{
    if checkers[player-1].type == .black || checkers[player-1].type == .white{
        return true
    }else{
        return false
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
        f = (player-1)+8
        l = (player-1)-1
        return [f+1,l+1]
    }else{
        f = (player-1)-8
        r = (player-1)+1
        return [f+1,r+1]
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
func finalCheck(isValid: Bool, player: Int)->String{
    var validInputs = [Int]()
    if isValid{
        if player % 8 == 0 || (player-1) % 8 == 0{
            validInputs.append(contentsOf: check(toCheck: firstAndLastColumn(player: player)))
            return "\(player) can move to \(validInputs) "
        }else{
            validInputs.append(contentsOf: check(toCheck: anyOtherChecker(player: player)))
            return "\(player) can move to \(validInputs) "
        }
    }
    return "⚠️ your input is invalid"
}
for _ in 0...64{
    printTable()
    print("👋🏻 Please type a number for a piece to move")
    input = Int(readLine()!)!
    print(finalCheck(isValid: canMove(player: input), player: input))
    var movement = Int(readLine()!)!
    checkers[movement-1].type = checkers[input-1].type
    checkers[input-1].type = .none
}

