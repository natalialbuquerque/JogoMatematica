import SwiftUI

struct playButton: View {
    @Binding var position: CGSize
    var body: some View {
        Button("Playbutton") {
            
        }
    }
}
struct ContentView: View {
        @State private var dropping = -470
    
        @State private var offset = CGSize.zero
        @State private var dragOffSet = CGSize.zero
    
        @State private var offSetInicio = CGSize(width: Int.random(in: -170...170), height: -470)
        @State private var offSetFim = CGSize(width: Int.random(in: -170...170), height: 440)
    
    private var caranguejoSize = CGSize(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.2)
    func apertouBotao(){
    }
    
    var body: some View {
        ZStack {
            Image("BlueBrackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Image("bubble")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .offset(x: offSetInicio.width, y: CGFloat(dropping))
                .animation(.easeIn(duration: 3).repeatForever(autoreverses: false))
                .onAppear() {
                    dropping = 440
                }
            
                
            
            VStack{
                ZStack{
                    Image("bluerectangle")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 414, height: 190)

                    HStack{
                        Button(action: {
                            apertouBotao()
                        }) {
                            Image("botaohome")
                        }

                        Image("goal2")

                        Button(action: {
                            apertouBotao()
                            
                        }) {
                            Image("botaopausa")
                        }
                    }
                }
               
                Spacer()
                Image("crab")
                    .resizable()
                    .frame(width: 164.71, height: 100.0)
                    .offset(x: offset.width + dragOffSet.width)
                    .animation(.easeInOut, value: 100)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                withAnimation(.easeIn){
                                    if(abs(self.offset.width+value.translation.width) + caranguejoSize.width/2 < UIScreen.main.bounds.width/2){
                                        self.dragOffSet.width = value.translation.width
                                    }
                                }
                                
                            }
                            .onEnded{ value in
                                withAnimation(.easeIn){
                                    self.offset.width += self.dragOffSet.width
                                    self.dragOffSet = .zero
                                }
                            }
                    )
            }
        }
        
    }
    
    func screenBounds() -> CGFloat {
        let max = UIScreen.main.bounds.width
        //        let currentBound = abs(offset.width)
        return  max
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
