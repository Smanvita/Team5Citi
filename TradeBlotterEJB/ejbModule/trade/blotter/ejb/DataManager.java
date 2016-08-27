package trade.blotter.ejb;

import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;


/**
 * Session Bean implementation class DataManager
 */
@Stateless
@Local(DataManagerLocal.class)
@Remote(DataManagerRemote.class)
public class DataManager implements DataManagerRemote, DataManagerLocal {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="TradeBlotterJPA-PU")
    EntityManager em;
    
	
	public DataManager() {
        // TODO Auto-generated constructor stub
    }


	

/*    @Override
    public List<Trade> getAllTrades(){
        TypedQuery<Trade> query = em.createQuery("SELECT t FROM Trade AS t", Trade.class);

        // Execute the query, and get a collection of entities back.
        List<Trade> trades = query.getResultList();
        return trades;
    }*/    
}
