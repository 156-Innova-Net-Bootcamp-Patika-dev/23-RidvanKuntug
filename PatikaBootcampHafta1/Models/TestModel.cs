using System.Collections.Generic;

namespace PatikaBootcampHafta1.Models
{
    //We create a list class to use instead of a database
    public class TestModel
    {
        public int Id { get; set; }
        public string Name { get; set; }

        //Method to create data
        public List<TestModel> CreateTestModel()
        {
            //List creation and data insertion
            List<TestModel> datas = new List<TestModel>
                {
                    new TestModel {Id = 0, Name = "Samsung"},
                    new TestModel {Id = 1, Name = "Apple"},
                    new TestModel {Id = 2, Name = "Xiaomi"},
                    new TestModel {Id = 3, Name = "Huawei"},
                    new TestModel {Id = 4, Name = "OPPO"},
                    new TestModel {Id = 5, Name = "OnePlus"}
                };
            //Sending the generated data to the requester
            return datas;
        }
    }

}
