using Microsoft.AspNetCore.Mvc;
using SiteManagementUi.Models.MessageModels;
using SiteManagementUi.Services;
using System.Collections.Generic;

namespace SiteManagementUi.Controllers
{
    public class MessageController : Controller
    {
        public readonly int _id;
        public MessageController()
        {
            _id = UserService.Token.Id;
        }
        public IActionResult GetMessageByReciverId()
        {
            if (_id > 0)
            {
                List<GetMessageModel> getMessageModel = MessageService.GetMessageByReciverId(_id);
                return View(getMessageModel);
            }
            return View();
        }
        public IActionResult GetMessageBySenderId()
        {
            if (_id > 0)
            {
                List<GetMessageModel> getMessageModel = MessageService.GetMessageBySenderId(_id); ;
                return View(getMessageModel);
            }
            return View();
        }

        public IActionResult ReadMessage(int id)
        {
            MessageService.ReadMessage(id);

            return Redirect("/Message/GetMessageByReciverId");
        }

        public IActionResult AddMessage(AddMessageModel messageModel)
        {
            if (messageModel.MessageText is not null)
            {
                messageModel.Sender_Id = UserService.Token.Id;
                MessageService.PostMessage(messageModel);
            }
            ModelState.Clear();
            messageModel = new AddMessageModel();
            return View();
        }
    }
}
