//
//  InitialExpensesCOPData.swift
//  DTDW
//
//  Created by Sopnil Sohan on 13/11/24.
//

import SwiftUI

struct InitialExpensesCOPData: View {
    @State private var marketValue: Int?
    @State private var purchasePriceValue: Int?
    @State private var downPaymentValue: Int?
    @State private var interestRateValue: Double?
    @State private var mortgageLengthValue: Int?
    
    @State private var selectedButton: ButtonType? = .costOfPurchase
    
    // Formatter for numbers without decimals
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    // Formatter for percentages and rates with decimals
    private let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    enum ButtonType {
        case costOfPurchase, costOfRepair
    }
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 10) {
                Text("Initial Expenses")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.colorFont)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity, maxHeight: 2)
                    .foregroundStyle(Color.grayDividerColor)
            }
            .padding(.top, 20)
            
            VStack(spacing: selectedButton == .costOfRepair ? 5 : 15) {
                HStack(spacing: 10) {
                    Button(action: {
                        selectedButton = .costOfPurchase
                    }) {
                        Text("Cost of Purchase")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: 37)
                            .padding(10)
                            .background(selectedButton == .costOfPurchase ? Color.mimiPinkColor : Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.deepPurpelColor, lineWidth: 1)
                            )
                            .shadow(color: Color.blackOnePercentColor, radius: 4, x: 0, y: 1)
                    }
                    
                    Button(action: {
                        selectedButton = .costOfRepair
                    }) {
                        Text("Cost of Repair")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: 37)
                            .padding(10)
                            .background(selectedButton == .costOfRepair ? Color.mimiPinkColor : Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.deepPurpelColor, lineWidth: 1)
                            )
                            .shadow(color: Color.blackOnePercentColor, radius: 4, x: 0, y: 1)
                    }
                }
                
                
                VStack(spacing: selectedButton == .costOfPurchase ? 15 : 0) {
                    Text(selectedButton == .costOfPurchase ? "Startup Expenses" : "")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.black)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leadingLastTextBaseline)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(maxWidth: .infinity, maxHeight: 2)
                        .foregroundStyle(Color.grayDividerColor)
                    
                }
                
                VStack(spacing: 10) {
                    if selectedButton == .costOfPurchase {
                        InputRow(label: "Finder’s Fee", placeholder: "$0", value: $marketValue, formatter: numberFormatter)
                        InputRow(label: "Inspection", placeholder: "$0", value: $purchasePriceValue, formatter: numberFormatter)
                        InputRow(label: "Title Search Fee", placeholder: "$300", value: $downPaymentValue, formatter: numberFormatter)
                        InputRow(label: "Title Insurance", placeholder: "$100", value: $interestRateValue, formatter: decimalFormatter)
                        InputRow(label: "Appraisal", placeholder: "$0", value: $mortgageLengthValue, formatter: numberFormatter)
                        InputRow(label: "Deed Recording Fee", placeholder: "$100", value: $mortgageLengthValue, formatter: numberFormatter)
                        InputRow(label: "Loan Origination Fee", placeholder: "$0", value: $mortgageLengthValue, formatter: numberFormatter)
                        InputRow(label: "Survey", placeholder: "$0", value: $mortgageLengthValue, formatter: numberFormatter)
                        InputRow(label: "Other", placeholder: "$0", value: $mortgageLengthValue, formatter: numberFormatter)
                            .padding(.bottom, 15)
                    } else if selectedButton == .costOfRepair {
                        InputRow(label: "Cosmetic Minor", placeholder: "$0", value: $marketValue, formatter: numberFormatter)
                            .padding(.top, selectedButton == .costOfRepair ? 10 : 0)
                        
                        InputRow(label: "Cosmetic Major", placeholder: "$0", value: $marketValue, formatter: numberFormatter)
                        InputRow(label: "Structural", placeholder: "$0", value: $marketValue, formatter: numberFormatter)
                        InputRow(label: "Fixtures/Appliances", placeholder: "$0", value: $marketValue, formatter: numberFormatter)
                        InputRow(label: "Landscaping", placeholder: "$0", value: $marketValue, formatter: numberFormatter)
                        InputRow(label: "Other", placeholder: "$0", value: $marketValue, formatter: numberFormatter)
                        InputRow(label: "Contingency Factor", placeholder: "10.0%", value: $marketValue, formatter: numberFormatter)
                            .padding(.bottom, 15)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 1, y: 1)
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}
