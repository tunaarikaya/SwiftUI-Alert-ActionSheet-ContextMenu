
import SwiftUI

struct ContentView: View {
    @State private var alert = false
    @State private var actionSheet = false
    
    var body: some View {
        VStack(spacing:100) {
            Button("Alerti"){
                alert = true
            }.alert("Başlık",isPresented: $alert,actions: {
                
                Button("İptal",role: .cancel,action: {
                    print("İptal seçildi")
                })
                Button("Tamam",role: .destructive,action: {
                    print("Tamam seçildi")
                })
                
            },message: {Text("İçerik")})
            
            Button("Action Sheet"){
                actionSheet = true
            }.actionSheet(isPresented: $actionSheet){
                ActionSheet(title: Text("Başlık"),
                            message: Text("İçerik"),
                            buttons: [
                                .default(Text("İptal"),action: {
                                    print("İptal seçildi")
                                }),
                                .destructive(Text("Tamam"),action: {
                                    print("Tamam seçildi")
                                })
                            ])
            }
            
            Text("Context Menu")
                .contextMenu{
                    Button{
                        print("Resim seçildi")
                    }label: {
                        Label("Resim Çek",systemImage: "camera")
                    }
                    
                    Button{
                        print("Video seçildi")
                    }label: {
                        Label("Video Kaydet",systemImage: "video")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
