using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using SiteManagementApplication.Operations.UserOperations.Queries.GetUser;
using SiteManagementInfrastructure.DatabaseContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteManagementApplication.Operations.MessageOperations.Queries.GetMeesage
{
    public class GetMessageBySenderIdQuery
    {
        public GetMessageModel Model { get; set; }

        private readonly ApplicationDbContext _dataBase;
        private readonly IMapper _mapper;
        public int newSenderId { get; set; }

        public GetMessageBySenderIdQuery(ApplicationDbContext dataBase, IMapper mapper)
        {
            _dataBase = dataBase;
            _mapper = mapper;
        }

        public List<GetMessageModel> Handle()
        {
            var message = _dataBase.Messages.Include(c => c.Sender_User).Include(c => c.Reciver_User)
                .Where(a => a.Sender_Id == newSenderId).OrderBy(c => c.MessageId);

            if (message is not null)
            {
                List<GetMessageModel> messageList = _mapper.Map<List<GetMessageModel>>(message);


                //Bu işlemler mapping tarafında yapıldı
                /*GetAllUserQuery query = new GetAllUserQuery(_dataBase, _mapper);
                var userObj = query.Handle();

                foreach (GetMessageModel msj in messageList)
                {
                    //Sender_Id ile eşleşen kişinin adını SenderName e yazıyoruz
                    messageList.Where(a => a.Sender_Id == msj.Sender_Id).FirstOrDefault().SenderName
                        =
                        userObj.Where(a => a.Id == msj.Sender_Id).FirstOrDefault().UserFullName;

                    //Reciver_Id ile eşleşen kişinin adını ReciverName e yazıyoruz
                    messageList.Where(a => a.Reciver_Id == msj.Reciver_Id).FirstOrDefault().ReciverName
                        =
                        userObj.Where(a => a.Id == msj.Reciver_Id).FirstOrDefault().UserFullName;

                }*/
                return messageList;
            }
            else
            {
                throw new InvalidOperationException("Mesaj yok.");
            }
        }
    }
}
