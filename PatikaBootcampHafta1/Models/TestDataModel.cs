using System.Collections.Generic;
using System.Linq;

namespace PatikaBootcampHafta1.Models
{
    public static class TestDataModel
    {
        //An object of the TestModel is created to use it here
        public static List<TestModel> dataList = new List<TestModel>();

        //Return the name by Id
        public static string GetTestModelWithId(int id)
        {
            //Generating string of the result to be returned to the client
            return dataList.Find(x => x.Id == id).Name;
        }

        public static List<TestModel> GetAllTestModel() { return dataList; }

        //This method makes a new item adding to the list
        public static bool AddToTestModel(string name)
        {
            //To determine the starting id, we take the last id of the ready list.
            int lastId;
            try
            {
                lastId = dataList.Last().Id;
            }
            catch
            {
                lastId = -1;
            }
            //Adding to list if name not exist
            if (dataList.Find(x => x.Name == name) == null)
            {
                //First Count
                int count = dataList.Count;
                dataList.Add(new TestModel { Id = lastId + 1, Name = name });
                //Count check
                if (count < dataList.Count)
                {
                    return true;
                }
                else { return false; }
            }
            else { return false; }
        }
        //This method edit the matching Id data in the list
        public static bool ChangeTestModel(int id, string name)
        {
            //Is Id null then return false
            if (dataList.Find(x => x.Id == id) == null)
            {
                return false;
            }
            //Is data already exist then return false
            else if (dataList.Find(x => x.Id == id).Name == name)
            {
                return false;
            }
            //then change
            else
            {
                //Replaces the name in the incoming Id with the new incoming name
                dataList.Find(x => x.Id == id).Name = name;

                //Is the operation successful? check
                if (dataList.Find(x => x.Id == id).Name == name)
                {
                    return true;
                }
                else { return false; }
            }

        }

        //This method deletes data with matching Name
        public static bool DeleteTestModel(string name)
        {
            //First Count
            int count = dataList.Count;
            //Deleting operation
            dataList.RemoveAll(x => x.Name == name);
            //Count check
            if (count > dataList.Count)
            {
                return true;
            }
            else { return false; }
        }


        //Method to fill data
        public static bool FillTestModel()
        {
            //First Count
            int count = dataList.Count;
            List<string> rawNames = new List<string>() {"Samsung",
                                                        "Apple",
                                                        "Xiaomi",
                                                        "Huawei",
                                                        "OPPO",
                                                        "OnePlus"
                                                        };
            //Filling the list for testing
            foreach (string name in rawNames)
            {
                AddToTestModel(name);
            }
            //Count check
            if (count < dataList.Count)
            {
                return true;
            }
            else { return false; }
        }
    }
}
