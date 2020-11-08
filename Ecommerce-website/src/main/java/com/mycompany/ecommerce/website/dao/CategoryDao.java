
package com.mycompany.ecommerce.website.dao;

import com.mycompany.ecommerce.website.entities.category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public int saveCategory(category cat){
        
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        int catId = (int)session.save(cat);
        
        tx.commit();
        session.close();
        
        return catId;
        
    }
    
    public List<category> getCategories(){
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<category> list = query.list();
        return list;
    }
    
}
