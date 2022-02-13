//
//  Home.swift
//  UI-462
//
//  Created by nyannyan0328 on 2022/02/13.
//

import SwiftUI

struct Home: View {
    @State var progress : CGFloat = 0.5
    @State var startAniamtion : CGFloat = 0
    var body: some View {
        VStack{
            VStack{
                
                
                Button {
                    
                    progress -= 0.01
                    
                    
                } label: {
                    
                    
                            Image("p1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(8)
                            .background(
                            
                                Color.white,in: Circle()
                            
                            )
                          
                           
                }
               

                Text("King Lion")
                    .font(.title.weight(.black))
                    .foregroundColor(.gray)
                    .kerning(1.3)
                    .blur(radius:0.1)
                  
            }
            .padding(.bottom,80)
              
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                ZStack{
                    
                    Image(systemName: "drop.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red.opacity(0.3))
                        .scaleEffect(x: 1.1, y: 1)
                        .offset(y: -1)
                    
                    
                    WaterView(progress: progress, waveHeight: 0.1, offset: startAniamtion)
                        .fill(Color("Blue"))
                        .overlay(content: {
                            
                            
                            
                            Circle()
                                .fill(.white.opacity(0.3))
                                .frame(width: 16, height: 16)
                                .offset(x: 10, y: 30)
                        
                        
                        Circle()
                            .fill(.white.opacity(0.1))
                            .frame(width: 15, height: 15)
                            .offset(x: 40,y: 30)
                        
                        Circle()
                            .fill(.white.opacity(0.1))
                            .frame(width: 15, height: 15)
                            .offset(x: 40,y: 30)
                        
                        Circle()
                            .fill(.white.opacity(0.1))
                            .frame(width: 15, height: 15)
                            .offset(x: -30,y: 80)
                        
                        
                        Circle()
                            .fill(.white.opacity(0.1))
                            .frame(width: 25, height: 25)
                            .offset(x: 50,y: 70)
                        
                        Circle()
                            .fill(.white.opacity(0.1))
                            .frame(width: 15, height: 15)
                            .offset(x: 40,y: 100)
                        
                        Circle()
                            .fill(.white.opacity(0.1))
                            .frame(width: 15, height: 15)
                            .offset(x: -40,y: 50)
                            
                            
                        })
                        .mask {
                            
                            Image(systemName: "drop.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                            
                            
                        }
                        .overlay(alignment: .bottom) {
                            
                         
                                
                                Button {
                                    
                                    progress += 0.1
                                    
                                } label: {
                                    
                                    Image(systemName: "plus")
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .padding(20)
                                        .background(.white,in: Circle())
                                        .shadow(radius: 10)
                                }
                                .offset(y: 30)
                                
                                
                            
                        

                            
                            
                        }
                        
                    
                    
                    
                    
                    
                    
                }
                .frame(width: size.width, height: size.height)
                .onAppear {

                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)){


                        startAniamtion = size.width
                    }
            }
            .frame(height:280)
            .padding(.top,60)
           
                
                
            }
            
            
            Slider(value: $progress)
                .foregroundColor(.red)
             
            
            
            
            
            
    
            
            
        }
        .padding()
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(Image("p1").resizable().ignoresSafeArea()
                    
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct WaterView : Shape{
    
    var progress : CGFloat
    
    var waveHeight : CGFloat
    
    var offset : CGFloat
    
    var animatableData: CGFloat{
        
        get{offset}
        set{offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            
            path.move(to:.zero)
            
            
            let progressHeight = (1 - progress) * rect.height
            
            let height = waveHeight * rect.height
            
            
            for value in stride(from: 0, to: rect.width, by: 6){
                
                
                let x : CGFloat = value
                
                let sine = sin(Angle(degrees: value + offset).radians)
                
                
                let y : CGFloat = (progressHeight + (height * sine))
                
                
                path.addLine(to: CGPoint(x: x, y: y))
                
                
                
            }
            
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            
            
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            
            
            
            
            
        }
    }
}
