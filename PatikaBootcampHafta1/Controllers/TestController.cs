using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

using PatikaBootcampHafta1.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PatikaBootcampHafta1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        // GET: api/<TestController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<TestController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();
            string temp = datas.Find(x => x.Id == id).Name;
 
            return temp;
        }

        // POST api/<TestController>
        [HttpPost("{name}")]
        public string Post(string name)
        {
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();

            datas.Add(new TestModel { Id = datas.Count, Name = name });

            string temp = "Id{" + datas.Find(x => x.Id == (datas.Count) - 1).Id + "} Name{" + datas.Find(x => x.Id == (datas.Count)-1).Name + "}";

            return "Added: " + temp;
        }

        // PUT api/<TestController>/5
        [HttpPut("{id}")]
        public string Put(int? id, string name)
        {
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();


            string temp = "Id{" + datas.Find(x => x.Id == id).Id + "} " +
                "Name{" + datas.Find(x => x.Id == id).Name + "} => ";

            datas.Find(x => x.Id == id).Name = name;

            temp = temp + " New Name{" + datas.Find(x => x.Id == id).Name + "}";

            return "Changed: " + temp;
        }

        // DELETE api/<TestController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            TestModel create = new TestModel();
            List<TestModel> datas = create.CreateTestModel();
            string temp = datas.Find(x => x.Id == id).Name;
            datas.RemoveAll(x => x.Id == id);

            return "Delete: " + temp + " New Item Count: " + datas.Count;
        }

    }
}
