//
//  AgentDetail.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 26/05/22.
//

import SwiftUI

struct AgentDetail: View {
    var agent: Agent
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom)
            VStack{
                Spacer()
                Image(uiImage: (agent.fullPortraitV2?.load()) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 850)
                        .padding(20)
                Spacer()
            }
            .ignoresSafeArea()
            
            
            VStack{

                Spacer()

                HStack{
                    Image(uiImage: (agent.role?.displayIcon.load()) ?? UIImage())
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .cornerRadius(20)

                    Text(agent.displayName)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(5)

                }
                .padding()
                
                Button{
                    showSheet.toggle()
                        
                } label: {
                    Text("DESCRIPTION")
                        .bold()
                        .foregroundStyle(.black)
                        .frame(width: 150, height: 30)
                        .background(.white)
                        .cornerRadius(100)
                }
                .padding(.bottom, 100)
                
                .halfSheet(showSheet: $showSheet){
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [.black, .red]), startPoint: .top, endPoint: .bottom)
                        
                        VStack{
                            Image(systemName: "chevron.compact.down")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(height: 20)
                                .padding(.top, 30)
                            
                            ScrollView{
                                VStack{
                                    HStack{
                                        Text("Description")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 20)
                                    
                                    Text(agent.agentDescription)
                                        .multilineTextAlignment(.center)
                                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                        .offset(y: 10)
                                        .foregroundStyle(.white)
                                    
                                    HStack{
                                        Text("Role")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                    }
                                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))
                                    
                                    HStack{
                                        Image(uiImage: (agent.role?.displayIcon.load()) ?? UIImage())
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 40)
                                        
                                        Text(agent.role?.displayName.rawValue ?? "Unknown")
                                            .font(.title2)
                                            .foregroundStyle(.white)
                                            .padding(.leading, 3)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 40)
                                    
                                    HStack{
                                        Text("Abilities")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                    }
                                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))
                                    
                                    ForEach(agent.abilities, id: \.slot){ ability in
                                        
                                        HStack{
                                            VStack{
                                                AsyncImage(url: URL(string: ability.displayIcon ?? "Unknown")) { image in
                                                    image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 55)
                                                } placeholder: {
                                                    Color.red
                                                }
                                                
                                                Spacer()
                                            }
                                            
                                            VStack{
                                                
                                                HStack {
                                                    Text(ability.displayName)
                                                        .bold()
                                                        .font(.title2)
                                                        .foregroundStyle(.white)
                                                        .padding(.leading, 3)
                                                    .multilineTextAlignment(.leading)
                                                    
                                                    Spacer()
                                                }
                                                
                                                Text(ability.abilityDescription)
                                                    .foregroundStyle(.white)
                                                    .padding(.leading, 3)
                                                    .offset(y: 5)
                                            }
                                            
                                            Spacer()
                                            
                                        }
                                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                                        
                                    }
                                    .padding()
                                    
                                }
                                .padding(.bottom, 10)
                            }
                            Spacer()
                        }
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct AgentDetail_Previews: PreviewProvider {
    static var agents = AgentData().agents
    
    static var previews: some View {
        AgentDetail(agent: agents[0])
    }
}

extension View{
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView)-> some View{
        
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet)
            )
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable{
    var sheetView: SheetView
    @Binding var showSheet: Bool
    
    let controller = UIViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if showSheet{
            let sheetController = UIHostingController(rootView: sheetView)
            
            uiViewController.present(sheetController, animated: true) {
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}

