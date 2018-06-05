/*
package org.silkdog.maven.hikoco.item.etc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

public class ItemListObject {

    public ItemListObject() {

    }

    public void doWork(Model model, Map<String, String> map, int page_Number, int index_Count) {

        int page_max = page_Number;
        int index_cnt = index_Count;

        int lastPage = 0;

        if ((index_cnt % page_max) == 0) {
            lastPage = (index_cnt / page_max);
        } else {
            lastPage = (index_cnt / page_max) + 1;
        }

        System.out.println("마지막 페이지: " + lastPage);

        model.addAttribute("lastPage", lastPage);


        if (!map.containsKey("selectedIndex") || (Integer.parseInt((String) map.get("selectedIndex")) == 1)) {
            model.addAttribute("selectedIndex", 1);


            HashMap<String, Object> exepMap = new HashMap<String, Object>();
            exepMap.put("startIndexNum", 0);
            exepMap.put("startIndexNum", map.get("keword0"));
            exepMap.put("startIndexNum", map.get("keword1"));
            exepMap.put("startIndexNum", map.get("keword2"));
            exepMap.put("startIndexNum", map.get("keword3"));
            exepMap.put("startIndexNum", map.get("pageNum"));
            System.out.println("마지막:"+index_cnt);

            List<HashMap<String, Object>> getlist = itemDao.listByIndex(exepMap);
            model.addAttribute("beforeSelectedIndex", 1);
            model.addAttribute("getlist", getlist);


            if(lastPage == 1) {
                model.addAttribute("startIndex", 1);
                model.addAttribute("lastIndex", lastPage);
                model.addAttribute("front_end", 0);
                model.addAttribute("back_end", 0);
                System.out.println(lastPage);
            }
            else if(lastPage <= 5){
                model.addAttribute("startIndex", 1);
                model.addAttribute("lastIndex", lastPage);
                model.addAttribute("front_end", 0);
                model.addAttribute("back_end", 1);
                System.out.println(lastPage);
            } else{
                model.addAttribute("startIndex", 1);
                model.addAttribute("lastIndex", 5);
                model.addAttribute("front_end", 0);
                model.addAttribute("back_end", 1);
            }


        } else if ((Integer.parseInt((String) map.get("selectedIndex")) == lastPage) && (lastPage != 1)) {

            HashMap<String, Object> exepMap = new HashMap<String, Object>();
            exepMap.put("startIndexNum",  ((Integer.parseInt((String) map.get("selectedIndex"))) - 1) * page_max);
            exepMap.put("startIndexNum", map.get("keword0"));
            exepMap.put("startIndexNum", map.get("keword1"));
            exepMap.put("startIndexNum", map.get("keword2"));
            exepMap.put("startIndexNum", map.get("keword3"));
            exepMap.put("startIndexNum", map.get("pageNum"));

            List<HashMap<String, Object>> getlist = itemDao.listByIndex(exepMap);
            model.addAttribute("beforeSelectedIndex", Integer.parseInt((String) map.get("selectedIndex")));
            model.addAttribute("getlist", getlist);

            if (lastPage > 5) {
                model.addAttribute("startIndex", lastPage - 4);
                model.addAttribute("lastIndex", lastPage);
                model.addAttribute("front_end", 1);
                model.addAttribute("back_end", 0);
            } else if (lastPage <= 5) {
                model.addAttribute("startIndex", 1);
                model.addAttribute("lastIndex", lastPage);
                model.addAttribute("front_end", 1);
                model.addAttribute("back_end", 0);
            }
        }else if (Integer.parseInt((String) map.get("selectedIndex")) < lastPage - 1) {

            HashMap<String, Object> exepMap = new HashMap<String, Object>();
            exepMap.put("startIndexNum",((Integer.parseInt((String) map.get("selectedIndex"))) - 1) * page_max);
            exepMap.put("startIndexNum", map.get("keword0"));
            exepMap.put("startIndexNum", map.get("keword1"));
            exepMap.put("startIndexNum", map.get("keword2"));
            exepMap.put("startIndexNum", map.get("keword3"));
            exepMap.put("startIndexNum", map.get("pageNum"));

            List<HashMap<String, Object>> getlist = itemDao.listByIndex(exepMap);
            model.addAttribute("beforeSelectedIndex", Integer.parseInt((String) map.get("selectedIndex")));
            model.addAttribute("getlist", getlist);

            if (lastPage > 5) {
                model.addAttribute("startIndex", Integer.parseInt((String) map.get("selectedIndex")) - 2);
                model.addAttribute("lastIndex", Integer.parseInt((String) map.get("selectedIndex")) + 2);
                model.addAttribute("front_end", 1);
                model.addAttribute("back_end", 1);
            } else if (lastPage <= 5) {
                model.addAttribute("startIndex", 1);
                model.addAttribute("lastIndex", lastPage);
                model.addAttribute("front_end", 1);
                model.addAttribute("back_end", 1);
            }
        } else if (Integer.parseInt((String) map.get("selectedIndex")) == lastPage - 1) {
            HashMap<String, Object> exepMap = new HashMap<String, Object>();
            exepMap.put("startIndexNum", ((Integer.parseInt((String) map.get("selectedIndex"))) - 1) * page_max);
            exepMap.put("startIndexNum", map.get("keword0"));
            exepMap.put("startIndexNum", map.get("keword1"));
            exepMap.put("startIndexNum", map.get("keword2"));
            exepMap.put("startIndexNum", map.get("keword3"));
            exepMap.put("startIndexNum", map.get("pageNum"));

            List<HashMap<String, Object>> getlist = itemDao.listByIndex(exepMap);
            model.addAttribute("beforeSelectedIndex", Integer.parseInt((String) map.get("selectedIndex")));
            model.addAttribute("getlist", getlist);

            model.addAttribute("startIndex", Integer.parseInt((String) map.get("selectedIndex")) - 3);
            model.addAttribute("lastIndex", Integer.parseInt((String) map.get("selectedIndex")) + 1);
            model.addAttribute("front_end", 1);
            model.addAttribute("back_end", 1);

        } else if (Integer.parseInt((String) map.get("selectedIndex")) < 4) {

            HashMap<String, Object> exepMap = new HashMap<String, Object>();
            exepMap.put("startIndexNum", ((Integer.parseInt((String) map.get("selectedIndex"))) - 1) * page_max);
            exepMap.put("startIndexNum", map.get("keword0"));
            exepMap.put("startIndexNum", map.get("keword1"));
            exepMap.put("startIndexNum", map.get("keword2"));
            exepMap.put("startIndexNum", map.get("keword3"));
            exepMap.put("startIndexNum", map.get("pageNum"));

            List<HashMap<String, Object>> getlist = itemDao.listByIndex(exepMap);
            model.addAttribute("beforeSelectedIndex", Integer.parseInt((String) map.get("selectedIndex")));
            model.addAttribute("getlist", getlist);

            if(lastPage <= 5){
                model.addAttribute("startIndex", 1);
                model.addAttribute("lastIndex", lastPage);
                model.addAttribute("front_end", 1);
                model.addAttribute("back_end", 1);
            } else{
                model.addAttribute("startIndex", 1);
                model.addAttribute("lastIndex", 5);
                model.addAttribute("front_end", 1);
                model.addAttribute("back_end", 1);
            }

        }  else {
            HashMap<String, Object> exepMap = new HashMap<String, Object>();
            exepMap.put("startIndexNum", ((Integer.parseInt((String) map.get("selectedIndex"))) - 1) * page_max);
            exepMap.put("startIndexNum", map.get("keword0"));
            exepMap.put("startIndexNum", map.get("keword1"));
            exepMap.put("startIndexNum", map.get("keword2"));
            exepMap.put("startIndexNum", map.get("keword3"));
            exepMap.put("startIndexNum", map.get("pageNum"));

            List<HashMap<String, Object>> getlist = itemDao.listByIndex(exepMap);
            model.addAttribute("beforeSelectedIndex", 1);
            model.addAttribute("getlist", getlist);
            model.addAttribute("startIndex", 1);
            model.addAttribute("lastIndex", 1);
            model.addAttribute("front_end", 0);
            model.addAttribute("back_end", 0);
        }
    }
}
*/