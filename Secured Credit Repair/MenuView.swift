//
//  MenuView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/27/21.
//

import SwiftUI

struct MenuView: View {
    
    @State var isBookAppointmentItemTapped = false
    @State var isApplyLoanApplicationItemTapped = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Book an appointment")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .onTapGesture {
                        isBookAppointmentItemTapped.toggle()
                    }
                NavigationLink("",
                               destination:AppointmentsView(),
                isActive: $isBookAppointmentItemTapped)
                .navigationTitle("Home")
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "dollarsign.circle")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Apply for a loan")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .onTapGesture {
                        isApplyLoanApplicationItemTapped.toggle()
                    }
                NavigationLink("",
                               destination:LoanApplicationView(),
                isActive: $isApplyLoanApplicationItemTapped)
                .navigationTitle("Home")
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Messages")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

