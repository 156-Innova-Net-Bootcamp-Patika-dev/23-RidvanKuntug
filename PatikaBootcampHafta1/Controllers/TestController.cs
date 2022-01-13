using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

using PatikaBootcampHafta1.Models;

namespace PatikaBootcampHafta1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        // GET: method captures data if it is unvariable
        [HttpGet]
        //This method fill data and show all list to the client
        public string Get()
        {
            string temp;

            //Call the method that will do the fill list
            if (TestDataModel.FillTestModel())
            {
                temp = "Listeye eklemeler yapıldı. Mevcut Liste: \n";
            }
            else
            {
                temp = "Liste oluşturma başarısız. Mevcut Liste: \n";
            }

            //List fetching
            List<TestModel> testModels = TestDataModel.GetAllTestModel();
            //Generating string of the result to be returned to the client
            foreach (var data in testModels)
            {
                temp = temp + " {" + data.Id + "}" + data.Name + "\n";
            }
            //Result information return to client
            return temp;
        }

        // GET: method to catch the prompt if it contains the id variable
        [HttpGet("{id}")]
        //This method send the data on the matching Id to the client
        public string Get(int id)
        {
            //Fetching name by id
            string testName = TestDataModel.GetTestModelWithId(id);

            //Result information return to client
            return testName;
        }

        // POST method to catch the prompt if it contains the id variable
        [HttpPost("{name}")]
        //This method makes a new item adding to the list
        public string Post(string name)
        {
            //Call the method that will add to the list
            if (TestDataModel.AddToTestModel(name))
            {
                return "Ekleme başarılı";
            }
            else { return "Ekleme başarısız."; }
        }

        // PUT method to catch the prompt if it contains the id variable
        [HttpPut("{id}")]
        //This method edit the matching Id data in the list
        public string Put(int id, string name)
        {
            //Call the method that will change to the item
            if (TestDataModel.ChangeTestModel(id, name))
            {
                return "Düzenleme başarılı.";
            }
            else { return "Bir sorun oluştu."; }
        }

        // DELETE method to catch the prompt if it contains the id variable
        [HttpDelete("{name}")]
        //This method deletes data with matching Id
        public string Delete(string name)
        {
            //Call the method that will delete to the item
            if (TestDataModel.DeleteTestModel(name))
            {
                return "Silme başarılı.";
            }
            else { return "Bir sorun oluştu."; }

        }

    }
}
