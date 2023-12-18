//
//  ContentView.swift
//  Rock, Paper, Scissors
//
//  Created by Leos, Bryan - Student on 11/7/23.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    
    @State var win = 0
    @State var lose = 0
    @State var draw = 0
    
    @State var computerNo = Int.random(in: 0...2)
    
    @State private var needToWin = Bool.random()
    
    @State var userImage = ""
    @State private var options =  ["RockHand", "PaperHand", "ScissorHand"]
    
    @State private var placementImage = "QuestionMark"
    
    var toWin:String{
        if options[computerNo] == "RockHand"{
            return "PaperHand"
        } else if options[computerNo] == "PaperHand"{
            return "ScissorsHand"
        } else {
            return "RockHand"
        }
    }
    
    @State private var alertPresented = false
    @State private var userChoosed = false
    /*
     func chosen(user: String) {
     if user == toWin && needToWin == true {
     win += 1
     }
     if user == toWin && needToWin == false {
     
     }
     if user != toWin && needToWin == true {
     
     }
     if user != toWin && needToWin == false {
     
     win += 1
     }
     }
     */
    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors")
                .font(.largeTitle)
            Divider()
                .overlay(.black)
            //Change the url to a webpage about rock, paper, scissors
            Link(destination: URL(string:"https://thegeniusofplay.org/genius/play-ideas-tips/play-ideas/rock-paper-scissors.aspx#:~:text=A%20classic%20two%2Dperson%20game,See%20who%20wins%20each%20round!")!, label: {
                Text("Rules for Rock, Paper, Scissors")
                    .font(.headline)
            })
            Divider()
                .overlay(.black)
            HStack{
                VStack{
                    Text("You:")
                        .font(.subheadline)
                    //Add a if statement so when you questionMark stays until someone pushes the buttons. Or use a event so when user pushes a option it changes the image to the user choice(An variable is already made with the name questionMark to be as the placement. ). Both does the same, but I'm not sure which one will work.
                    if userChoosed == false{
                        Image("QuestionMark")
                            .resizable()
                            .frame(width:75, height:75, alignment:.center)
                            .clipShape(Circle())
                            .border(Color.black)
                            .padding()
                    }else{
                        Image(userImage)
                            .resizable()
                            .frame(width:75, height:75, alignment:.center)
                            .padding()
                    }
                }
                VStack{
                    Image("VS")
                        .resizable()
                        .frame(width:50,height:50,alignment: .center)
                }
                VStack{
                    Text("Computer:")
                        .font(.subheadline)
                    if userChoosed == false{
                        Image("QuestionMark")
                            .resizable()
                            .frame(width:75, height:75, alignment:.center)
                            .clipShape(Circle())
                            .border(Color.black)
                            .padding()
                    }else{
                        Image(toWin)
                            .resizable()
                            .frame(width:75, height:75, alignment:.center)
                            .padding()
                    }
                }
            }
            //Keep on adding to this and fix the error
            
            // decisions()
            Text("Wins: \(win)  Loses: \(lose)  Draws: \(draw)")
            Divider()
                .overlay(.black)
        }
        Text("You Choose:")
        HStack{
            Button{
                
                //chosen(user: userChoice)
                userImage = "RockHand"
                userChoosed = true
                compChoice()
            }label:{
                Image("RockHand")
                    .resizable()
                    .frame(width:100,height:100)
            }
            Button{
                
                //chosen(user: userChoice)
                userImage = "PaperHand"
                userChoosed = true
                compChoice()
            }label:{
                Image("PaperHand")
                    .resizable()
                .frame(width:100,height:100)            }
            Button{
                
                //chosen(user: userChoice)
                userImage = "ScissorsHand"
                userChoosed = true
                compChoice()
            }label:{
                Image("ScissorsHand")
                    .resizable()
                .frame(width:100,height:100)           }
        }
        Divider()
            .overlay(.black)
        Button{
            userChoosed = false
            userImage = ""
            win = 0
            lose = 0
            draw = 0
        }label:{
            Text("Reset")
                .font(.title)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .background(Color.red)
        }
    }
    func compChoice() {
        computerNo = Int.random(in: 0...2)
        decisions()
    }
    func decisions(){
        //let comps = options[computerNo]
        
        if toWin == "PaperHand" && userImage == "PaperHand"{
            draw += 1
        } else if toWin == "PaperHand" && userImage == "ScissorsHand"{
            win += 1
        } else if toWin == "PaperHand"  && userImage == "RockHand"{
            lose += 1
        } else if toWin == "RockHand" && userImage == "PaperHand"{
            win += 1
        } else if toWin == "RockHand" && userImage == "ScissorsHand"{
            lose += 1
        }else if toWin == "RockHand" && userImage == "RockHand"{
            draw += 1
        } else if toWin == "ScissorsHand" && userImage == "PaperHand"{
            lose += 1
        } else if toWin == "ScissorsHand" && userImage == "ScissorsHand"{
            draw += 1
        } else if toWin == "ScissorsHand" && userImage == "RockHand"{
            win += 1
        }
        print("win: \(win) lose: \(lose) draw:\(draw)")
    }
}

#Preview {
    ContentView()
}
