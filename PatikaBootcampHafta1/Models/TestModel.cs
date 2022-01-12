using System.Collections.Generic;

namespace PatikaBootcampHafta1.Models
{
    public class TestModel
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public List<TestModel> CreateTestModel()
        {
            List<TestModel> datas = new List<TestModel>
                {
                    new TestModel {Id = 0, Name = "Samsung"},
                    new TestModel {Id = 1, Name = "Apple"},
                    new TestModel {Id = 2, Name = "Xiaomi"},
                    new TestModel {Id = 3, Name = "Huawei"},
                    new TestModel {Id = 4, Name = "OPPO"},
                    new TestModel {Id = 5, Name = "OnePlus"}
                };
            return datas;
        }
    }

}
