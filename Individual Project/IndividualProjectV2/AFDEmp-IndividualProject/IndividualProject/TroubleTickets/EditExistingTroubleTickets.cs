﻿using System;
using System.Collections.Generic;

namespace IndividualProject
{
    class EditExistingTroubleTickets
    {
        private static ConnectToServer _db = new ConnectToServer();
        private static OutputControl print = new OutputControl();

        public static void EditOpenTicket()
        {
            string currentUsername = _db.RetrieveCurrentUserFromDatabase();
            string currentUsernameRole = _db.RetrieveCurrentUsernameRoleFromDatabase();

            print.QuasarScreen(currentUsername);
            print.UniversalLoadingOutput("Loading");
            Console.WriteLine("EDIT OPEN TECHNICAL TICKET");

            string listTicketsMsg = "Choose one of the following options\r\n";
            string viewList = "View Trouble Ticket List";
            string viewSpecific = "Edit Specific Trouble Ticket";
            string back = "\r\nBack";

            while (true)
            {
                string editTicket = SelectMenu.MenuColumn(new List<string> { viewList, viewSpecific, back }, currentUsername, listTicketsMsg).option;
                if (editTicket == viewList)
                {
                    _db.ViewListOfOpenCustomerTickets();
                    EditOpenTicketSubFunction();
                }
                else if (editTicket == viewSpecific)
                {
                    EditOpenTicketSubFunction();
                }
                else if (editTicket == back)
                {
                    print.QuasarScreen(currentUsername);
                    ActiveUserFunctions.UserFunctionMenuScreen(currentUsernameRole);
                }
            }
        }

        private static void EditOpenTicketSubFunction()
        {
            string currentUsernameRole = _db.RetrieveCurrentUsernameRoleFromDatabase();
            int TicketID = print.SelectTicketID();
            if (_db.CheckIfTicketIDWithStatusOpenExistsInList(TicketID) == false)
            {
                print.ColoredText($"There is no Customer Ticket with [ID = {TicketID}]\n\n(Press any key to continue)", ConsoleColor.DarkRed);
                Console.ReadKey();
                ActiveUserFunctions.UserFunctionMenuScreen(currentUsernameRole);
            }
            else
            {
                EditTicketOptions(TicketID);
                ViewExistingTickets.ViewSingleCustomerTicket(TicketID);
                ActiveUserFunctions.UserFunctionMenuScreen(currentUsernameRole);
            }
        }

        private static void EditTicketOptions(int ID)
        {
            string currentUsername = _db.RetrieveCurrentUserFromDatabase();
            string currentUsernameRole = _db.RetrieveCurrentUsernameRoleFromDatabase();

            string edit = "Edit Ticket Comment";
            string assign = "Edit Ticket's User assignment";
            string back = "\r\nBack";
            string editMsg = "\r\nChoose one of the following options to continue:\r\n";

            while (true)
            {
                string EditCommentAndAssignment = SelectMenu.MenuColumn(new List<string> { edit, assign, back }, currentUsername, editMsg).option;

                if (EditCommentAndAssignment == edit)
                {
                    string ticketComment = print.TicketComment();
                    _db.EditCommentOfOpenTicket(ID, ticketComment);
                }
                else if (EditCommentAndAssignment == assign)
                {
                    string newUserAssignment = AssignTroubleTickets.AssignTicketToUser();
                    AssignTroubleTickets.ChangeUserAssignmentToOpenTicket(ID, newUserAssignment);
                }
                else if (EditCommentAndAssignment == back)
                {
                    print.QuasarScreen(currentUsername);
                    ActiveUserFunctions.UserFunctionMenuScreen(currentUsernameRole);
                }
            }
        }
    }
}
