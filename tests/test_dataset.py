import pytest
from airflow.models import DagBag

@pytest.fixture()
def dag():
    dagbag = DagBag(dag_folder="/opt/airflow/dags",include_examples=False)
    return dagbag

def test_dag_count(dag):
    assert len(dag.dags) == 2

def test_dag_name(dag):
    assert set(dag.dag_id for dag in dag.dags.values()) == {"data_aware_producer", "data_aware_consumer"}

def test_task_count(dag):
    assert sum(len(dag.tasks) for dag in dag.dags.values()) == 2