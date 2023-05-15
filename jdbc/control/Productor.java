package control;
public class Productor {
    private int id;
    private long contractId;
    private String name;

    public Productor(long contractId, int id, String name) {
        this.id = id;
        this.contractId = contractId;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getContractId() {
        return contractId;
    }

    public void setContractId(long contractId) {
        this.contractId = contractId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
