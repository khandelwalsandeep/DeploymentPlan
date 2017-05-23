public class StringArrayTest {
    public static List<String> generateStringArray(Integer n){
        List<String> list1=new List<String>();
        for(Integer i=0;i<n;i++){
            list1.add('Test '+i);
        }
        return list1;
    }
}