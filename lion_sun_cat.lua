-- Mindful Money --
-- Money Management App --

-- Global variables
local currentBalance = 0
local incomeHistory = {}
local expenseHistory = {}

-- Main function
function main()
   print("Welcome to Mindful Money Money Management App!")
   local currentOption
   while currentOption ~= "quit" do 
      print("Please select an option:")
      print("1. Check Balance")
      print("2. Make a Deposit")
      print("3. Make a Withdrawal")
      print("4. View Income History")
      print("5. View Expense History")
      print("6. Quit")
      currentOption = io.read()
      if currentOption == "1" then
         checkBalance()
      elseif currentOption == "2" then 
         makeDeposit()
      elseif currentOption == "3" then
         makeWithdrawal()
      elseif currentOption == "4" then
         viewIncomeHistory()
      elseif currentOption == "5" then
         viewExpenseHistory()
      elseif currentOption == "6" then
         print("Thank you for using Mindful Money!")
      end
   end

end

-- Helper functions
function checkBalance()
   print("Your current balance is " .. currentBalance)
end

function makeDeposit()
   print("How much money would you like to deposit?")
   local depositAmount = io.read()
   
   table.insert(incomeHistory, depositAmount)
   currentBalance = currentBalance + depositAmount
   print("You have successfully deposited $" .. depositAmount .. " into your account")
end

function makeWithdrawal()
   print("How much money would you like to withdraw?")
   local withdrawalAmount = io.read()
   
   if currentBalance - withdrawalAmount < 0 then
   	  print("Insufficient funds")
   else
      table.insert(expenseHistory, withdrawalAmount)
      currentBalance = currentBalance - withdrawalAmount
      print("You have successfully withdrawn $" .. withdrawalAmount .. " from your account")
   end
end

function viewIncomeHistory()
   print("Your income history is:")
   for i,v in ipairs(incomeHistory) do
      print("Income: "..v)
   end
end

function viewExpenseHistory()
   print("Your expense history is:")
   for i,v in ipairs(expenseHistory) do
      print("Expense: "..v)
   end
end

-- Program Execution
main()