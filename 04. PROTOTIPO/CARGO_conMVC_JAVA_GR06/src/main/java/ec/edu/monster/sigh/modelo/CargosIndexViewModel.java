package ec.edu.monster.sigh.modelo;

import java.util.List;

public final class CargosIndexViewModel {
    private final List<PecarCargo> cargos;
    private final List<PedepDepar> departamentos;
    private final PecarCargo cargo;
    private final boolean editando;

    public CargosIndexViewModel(
            List<PecarCargo> cargos,
            List<PedepDepar> departamentos,
            PecarCargo cargo,
            boolean editando) {
        this.cargos = cargos;
        this.departamentos = departamentos;
        this.cargo = cargo;
        this.editando = editando;
    }

    public List<PecarCargo> getCargos() { return cargos; }
    public List<PedepDepar> getDepartamentos() { return departamentos; }
    public PecarCargo getCargo() { return cargo; }
    public boolean isEditando() { return editando; }
}
